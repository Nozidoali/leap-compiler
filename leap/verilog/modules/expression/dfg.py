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
        # topological sort
        children = []
        for child in node.children:
            index = self.insertNode(child)
            children.append(index)
        variableName = self.getVariableName(node)
        if variableName is not None and variableName in self.__variable_to_node_index:
            index = self.__variable_to_node_index[variableName]
            # we expend the children
            self.__nodes[index].children.extend(children)
            return index
        elif variableName is None:
            # only hash non-trivial nodes
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

    def toGraph(self, dotFile: str):
        try:
            import pygraphviz as pgv
            graph = pgv.AGraph(directed=True)
            for i, node in enumerate(self.__nodes):
                graph.add_node(i, label=node.label)
                for child in node.children:
                    graph.add_edge(child, i)
            graph.write(dotFile)
        except ImportError or ModuleNotFoundError as e:
            # if pygraphviz is not installed, use pydot
            import pydot
            graph = pydot.Dot(graph_type="digraph")
            
            # add subgraph
            subgraphFSM = pydot.Cluster("FSM")
            subgraphOther = pydot.Cluster("Other")
            # add nodes
            for i, node in enumerate(self.__nodes):
                if node.label == "cur_state" or node.label == "next_state":
                    subgraphFSM.add_node(pydot.Node(i, label=node.label, style="filled", fillcolor="lightblue"))
                elif node.label == "=":
                    # bypass assign
                    assert len(node.children) == 1
                    newChild = node.children[0]
                    # print(f"bypassing {i} to {newChild}")
                    continue
                else:
                    subgraphOther.add_node(pydot.Node(i, label=node.label))
                for child in node.children:
                    # if the child is an assign, we bypass it
                    if self.__nodes[child].label == "cur_state" or self.__nodes[child].label == "next_state":
                        graph.add_edge(pydot.Edge(child, i, color="lightblue"))
                    elif self.__nodes[child].label == "=":
                        assert len(self.__nodes[child].children) == 1
                        newChild = self.__nodes[child].children[0]
                        # print(f"bypassing {child} to {newChild}")
                        graph.add_edge(pydot.Edge(newChild, i))
                    else:
                        graph.add_edge(pydot.Edge(child, i))
            
            graph.add_subgraph(subgraphFSM)
            graph.add_subgraph(subgraphOther)
            
            graph.write(dotFile, format="dot")
            
