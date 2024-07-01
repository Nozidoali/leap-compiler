#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-28 12:23:16
Last Modified by: Hanyu Wang
Last Modified time: 2024-06-28 12:55:05
"""

from .binary import *
from .unary import *
from .special import *
from .array import *

import pygraphviz as pgv


class DFGNode:
    # Expressions are hard to handle because of the recursive nature

    def __init__(self, variable_name: str = None) -> None:
        self.variable_name = variable_name
        self.operation = None
        self.children = []

    def __repr__(self) -> str:
        return self.variable_name

    def isVariable(self):
        return self.operation == SOPType.VARIABLE
    
    def isConstant(self):
        return self.operation == SOPType.CONST

def createVariableNode(variable_name: str):
    node = DFGNode(variable_name)
    node.operation = SOPType.VARIABLE
    return node

def createConstantNode(value: int):
    node = DFGNode(str(value))
    node.operation = SOPType.CONST
    return node

def createBinaryOpNode(op: BOPType | str, left: DFGNode, right: DFGNode):
    if isinstance(op, str):
        op = BOPType.fromString(op)
    node = DFGNode(str(op.value))
    node.operation = op
    node.children = [left, right]
    return node

def createUnaryOpNode(op: UOPType | str, child: DFGNode):
    if isinstance(op, str):
        op = UOPType.fromString(op)
    node = DFGNode(str(op.value))
    node.operation = op
    node.children = [child]
    return node

def createConcatOpNode(children: list):
    node = DFGNode("\{\}")
    node.operation = SOPType.CONCAT
    assert isinstance(children, list)
    node.children = children
    return node


def createFuncCallNode(func_name: str, children: list):
    node = DFGNode(func_name)
    node.operation = SOPType.FUNCTION
    assert isinstance(children, list)
    node.children = children
    return node

def createAssignNodes(assignFrom: DFGNode, assignTo: str | DFGNode):
    newNodes = []
    if isinstance(assignTo, str):
        node = DFGNode(assignTo)
    else:
        node = DFGNode("=")
        child: DFGNode
        for child in assignTo.children:
            assert child.isVariable() or child.isConstant(), f"child = {child}"
            assert child.children == [], f"child = {child}"
            
            # we need to create a new node
            newNode = DFGNode(child.variable_name)
            newNode.operation = SOPType.ASSIGN
            newNode.children = [node]
            newNodes.append(newNode)
    
    node.operation = SOPType.ASSIGN
    node.children = [assignFrom]
    newNodes.append(node)
    
    return newNodes

def createArraySlicingNode(arrayName: DFGNode, indexFrom: DFGNode, indexTo: DFGNode):
    node = DFGNode(AOPType.SLICE.value)
    node.operation = AOPType.SLICE
    node.children = [arrayName, indexFrom, indexTo]
    return node

def createArrayIndexingNode(arrayName: DFGNode, index: DFGNode):
    node = DFGNode(AOPType.INDEX.value)
    node.operation = AOPType.INDEX
    node.children = [arrayName, index]
    return node

class DFGraph:
    def __init__(self) -> None:
        self.nodes = []
        self.__node_trav_index = 0
        self.__variables = {}
        self.__variable_fanouts = {}
        self.__variable_fanins = {}
        self.__outputs = set()
        self.__inputs = []

    def addNode(self, node: DFGNode, parentNode: DFGNode = None):
        assert isinstance(node, DFGNode), f"node = {node}"
        logger.debug(f"Adding node: {node}")
        if node.operation == SOPType.ASSIGN:
            if node.variable_name not in self.__variables:
                self.__variables[node.variable_name] = node
                self.__variable_fanouts[node.variable_name] = set()
            else:
                # we need to modify the variable
                oldNode = self.__variables[node.variable_name]
                if oldNode.operation != SOPType.VARIABLE:
                    logger.warning(f"Overwriting node: {oldNode}")
                oldNode.operation = SOPType.ASSIGN
                oldNode.children = node.children[:]
                return
        if node.isVariable():
            variable = node.variable_name
            if variable in self.__variables:
                # we modify the variable
                node.children = self.__variables[variable].children[:]
                node.operation = self.__variables[variable].operation
                return
            else:
                self.__variables[variable] = node
                self.__variable_fanouts[variable] = set()
            if parentNode is not None:
                self.__variable_fanouts[variable].add(node)
            
        for child in node.children:
            self.addNode(child, parentNode=node)
        self.nodes.append(node)

    def toGraphRec(self, node: DFGNode, graph: pgv.AGraph, visited: set) -> str:
        if node.variable_name in self.__variables:
            node_name: str = node.variable_name
            if node_name in visited:
                return node_name
            visited.add(node_name)
        else:
            self.__node_trav_index += 1
            node_name: str = f"{str(node.variable_name)}_{self.__node_trav_index}"
        logger.debug(f"Node: {node}, children: {node.children}")
        graph.add_node(node_name, label=node.variable_name)
        for child in node.children:
            childName = self.toGraphRec(child, graph, visited)
            graph.add_edge(childName, node_name)
        return node_name

    def toGraph(self) -> pgv.AGraph:
        self.__node_trav_index = 0
        graph = pgv.AGraph(directed=True)
        visited = set()
        for node in self.nodes:
            if node.operation != SOPType.ASSIGN:
                continue
            if node.variable_name not in self.__variable_fanouts:
                continue
            if len(self.__variable_fanouts[node.variable_name]) == 0:
                self.toGraphRec(node, graph, visited)
        return graph
