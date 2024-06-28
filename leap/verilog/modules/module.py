#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-25 18:07:25
Last Modified by: Hanyu Wang
Last Modified time: 2024-06-25 23:55:15
"""

import logging

logger = logging.getLogger(__name__)

from .declaration import *
from .expression import *

from enum import Enum

"""
// 1.4 Module. i.e., what is inside a module
?module_body: always_block
            | port_declaration ";" // This includes reg, wire, integer, real, time, realtime
            | parameter_assignment // This includes parameters and localparams
            | variable_assignment ";" // This includes assign
            | system_task
            | module_instantiation // This includes module instantiation
            | define_parameter // This includes defparam
"""


class ModuleBodyType(Enum):
    ALWAYS_BLOCK = ("always_block",)
    PORT_DECLARATION = ("port_declaration",)
    PARAMETER_ASSIGNMENT = ("parameter_assignment",)
    VARIABLE_ASSIGNMENT = ("variable_assignment",)
    SYSTEM_TASK = ("system_task",)
    MODULE_INSTANTIATION = ("module_instantiation",)
    DEFINE_PARAMETER = ("define_parameter",)

    @staticmethod
    def fromString(label: str):
        if label == "always_block":
            return ModuleBodyType.ALWAYS_BLOCK
        elif label == "port_declaration":
            return ModuleBodyType.PORT_DECLARATION
        elif label == "parameter_assignment":
            return ModuleBodyType.PARAMETER_ASSIGNMENT
        elif label == "variable_assignment":
            return ModuleBodyType.VARIABLE_ASSIGNMENT
        elif label == "system_task":
            return ModuleBodyType.SYSTEM_TASK
        elif label == "module_instantiation":
            return ModuleBodyType.MODULE_INSTANTIATION
        elif label == "define_parameter":
            return ModuleBodyType.DEFINE_PARAMETER
        else:
            return None


class Module:
    def __init__(
        self,
        attribute_instances: list,
        module_name: str,
        param_list: list,
        port_list: list,
        module_items: list,
    ):
        logger.info(
            f"Module: {module_name}, \n\tPorts: {port_list}, \n\tParameters: {param_list}"
        )

        self.module_name = module_name
        self.param_list = param_list
        self.port_list = {}
        for port in port_list:
            self.port_list[port.getPortName()] = port
        self.attribute_instances = attribute_instances

        self.dfg = DFGraph()

        self.internal_signals = {}
        for item in module_items:
            if isinstance(item, tuple):
                bodyType = ModuleBodyType.fromString(item[0])
                match bodyType:
                    case ModuleBodyType.PORT_DECLARATION:
                        ports = item[1]
                        for port in ports:
                            if port.getPortName() in self.port_list:
                                old_port = self.port_list[port.getPortName()]
                                old_port.setRange(port.getRange())
                                old_port.setHeader(port.getHeader())
                                self.port_list[port.getPortName()] = old_port
                            else:
                                self.internal_signals[port.getPortName()] = port
                    case ModuleBodyType.VARIABLE_ASSIGNMENT:
                        print(item)
                        signal = item[1]
                        node = item[2]
                        self.dfg.add_node(node)
                    case _:
                        pass

    def __repr__(self):
        return self.module_name
