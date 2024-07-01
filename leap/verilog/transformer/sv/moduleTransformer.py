#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-25 23:18:52
Last Modified by: Hanyu Wang
Last Modified time: 2024-06-26 00:00:10
"""

import logging

logger = logging.getLogger(__name__)

from lark import Transformer, v_args, Tree
from ...modules import *


class ModuleTransformer(Transformer):
    # this is a list of lots of items, so we set inline=False
    # module: "module" CNAME module_definition ";" declaration* "endmodule"
    @v_args(inline=False)
    def module(self, items):
        module_definition = items[0]
        module_name, param_list, port_list = module_definition

        module_items = items[1:]
        return Module(
            attribute_instances=[],
            module_name=module_name,
            param_list=param_list,
            port_list=port_list,
            module_items=module_items,
        )

    @v_args(inline=False)
    def module_definition(self, args):
        module_name = args[0]
        param_list = []
        port_list = []
        for item in args[1:]:
            if len(item) > 0 and isinstance(item[0], Port):
                port_list.extend(item)
            elif len(item) > 0 and isinstance(item[0], Parameter):
                param_list.extend(item)
            else:
                assert False, f"item = {item}"
        return module_name, param_list, port_list

    @v_args(inline=True)
    def parameter_declaration(self, type, lvalue, expression):
        """
        parameter_declaration: ["signed"] [range] lvalue "=" expression
        """
        return Parameter(range=range, name=lvalue, value=expression)

    def parameter_assignments(self, items):
        return "parameter_assignment", []

    @v_args(inline=True)
    def variable_assignment(self, signal, expression):
        assert isinstance(signal, str) or isinstance(signal, DFGNode), f"signal = {signal}"
        assert isinstance(expression, DFGNode), f"expression = {expression}"
        return "variable_assignment", Assignment(signal, expression)

    def system_task(self, items):
        return "system_task", []

    def module_instantiation(self, items):
        return "module_instantiation", []

    def define_parameter(self, items):
        return "define_parameter", []

    @v_args(inline=True)
    def variable_name(self, name):
        return str(name)
