#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-25 19:20:27
Last Modified by: Hanyu Wang
Last Modified time: 2024-06-25 23:51:31
"""

import logging

logger = logging.getLogger(__name__)

from lark import Transformer, v_args, Tree
from ..modules import *
from .sv import *


class SystemVerilogTransformer(
    ModuleTransformer,
    DeclarationTransformer,
    StatementTransformer,
    PortTransformer,
    ExpressionTransformer,
    FSMTransformer,
    EventTransformer,
):
    def start(self, items):
        if isinstance(items[0], list):
            return Netlist(items[0])
        else:
            return Netlist([items[0]])

    def description(self, items):
        modules = []
        for item in items:
            if isinstance(item, Module):
                modules.append(item)
        return modules

    # we override the default method to return the data directly
    # this requires us to override all the methods without children
    def __default__(self, data, children, meta):
        assert isinstance(data, str)
        # use switch case to handle the data
        match data:
            # These are the AST nodes partially handled
            case "params":
                logger.info(
                    f"children[1:]: \n data = {data}, children = {children}, meta = {meta}"
                )
                return children[:]
            # These are the transparent AST nodes
            case "param_list" | "param_declaration" | "attribute_instances":
                logger.info(
                    f"children[0]: \n data = {data}, children = {children}, meta = {meta}"
                )
                return children[0]
            case _:
                return Tree(data, children, meta)
