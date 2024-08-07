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

import pygraphviz as pgv


class DFGNode:
    # Expressions are hard to handle because of the recursive nature

    def __init__(self, variable_name: str = None) -> None:
        self.variable_name = variable_name
        self.operation = None
        self.children = []

    def __repr__(self) -> str:
        return self.variable_name


def createDFGNode(variable_name: str):
    return DFGNode(variable_name)


def createBinaryOpNode(op: BOPType | str, left: DFGNode, right: DFGNode):
    if isinstance(op, str):
        op = BOPType.fromString(op)
    node = DFGNode(str(op))
    node.operation = op
    node.children = [left, right]
    return node


def createUnaryOpNode(op: UOPType | str, child: DFGNode):
    if isinstance(op, str):
        op = UOPType.fromString(op)
    node = DFGNode(str(op))
    node.operation = op
    node.children = [child]
    return node


def createConcatOpNode(children: list):
    node = DFGNode("concat")
    node.operation = SOPType.CONCAT
    node.children = children
    return node


def createFuncCallNode(func_name: str, children: list):
    node = DFGNode(func_name)
    node.operation = SOPType.FUNCTION
    node.children = children
    return node


class DFGraph:
    def __init__(self) -> None:
        self.nodes = []

    def add_node(self, node: DFGNode):
        self.nodes.append(node)

    def toGraphRec(self, node: DFGNode, graph: pgv.AGraph):
        graph.add_node(node.variable_name)
        for child in node.children:
            graph.add_edge(node.variable_name, child.variable_name)
            self.toGraphRec(child, graph)

    def toGraph(self) -> pgv.AGraph:
        graph = pgv.AGraph(directed=True)
        for node in self.nodes:
            self.toGraphRec(node, graph)
        return graph
