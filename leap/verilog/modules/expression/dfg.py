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


class DFGraph:
    class Node:
        def __init__(self, node: int) -> None:
            self.node = node
            self.data = None
            self.label = None
            self.children = []
            self.parents = []

        def __repr__(self) -> str:
            return f"{self.node.variable_name} -> {self.children}"

    def __init__(self) -> None:
        self.nodes = []
        self.__node_index: int = 0
        self.__node_trav_index = 0
        self.__variable_definitions = {}
        self.__variable_fanouts = {}

        self.__nodes = []
        self.__variable_to_node_index = {}
        self.__operation_to_nodes_index = {
            opName: []
            for opName in [op.value for op in SOPType]
            + [op.value for op in AOPType]
            + [op.value for op in BOPType]
            + [op.value for op in UOPType]
        }

    def createNewNode(self):
        curr_index = self.__node_index
        self.__node_index += 1
        return curr_index

    @staticmethod
    def getVariableName(node: DFGNode):
        if node.operation == SOPType.VARIABLE:
            return node.variable_name
        if node.operation == SOPType.CONDITIONAL_ASSIGN:
            return node.variable_name
        if node.operation == SOPType.ASSIGN:
            return node.variable_name
        if node.operation == SOPType.CONST:
            return node.variable_name
        return None

    def insertNode(self, node: DFGNode):
        variableName = self.getVariableName(node)
        if variableName is not None and variableName in self.__variable_to_node_index:
            index = self.__variable_to_node_index[variableName]
            return index
        # topological sort
        children = []
        for child in node.children:
            index = self.insertNode(child)
            children.append(index)
        nodesWithSameOp = self.__operation_to_nodes_index[node.operation.value]
        for index in nodesWithSameOp:
            if self.__nodes[index].children == children:
                return index
        rootIndex = self.createNewNode()
        if variableName is not None:
            self.__variable_to_node_index[variableName] = rootIndex
        self.__operation_to_nodes_index[node.operation.value].append(rootIndex)
        newNode = self.Node(node)
        newNode.children = children
        newNode.data = node.variable_name
        newNode.label = node.variable_name
        for child in children:
            self.__nodes[child].parents.append(rootIndex)
        self.__nodes.append(newNode)
        assert rootIndex == len(self.__nodes) - 1
        return rootIndex

    def addNode(self, node: DFGNode, parentNode: DFGNode = None):
        self.insertNode(node)
        return

    def toGraphRec(self, node: DFGNode, graph: pgv.AGraph, visited: set) -> str:
        if node.variable_name in self.__variable_definitions:
            node_name: str = node.variable_name
            if node_name in visited:
                return node_name
            # print(f"Node: {node}, children: {node.children}")
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
        graph = pgv.AGraph(directed=True)
        for i, node in enumerate(self.__nodes):
            graph.add_node(i, label=node.label)
            for child in node.children:
                graph.add_edge(child, i)
        return graph

