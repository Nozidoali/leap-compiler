#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-07-25 14:55:16
Last Modified by: Hanyu Wang
Last Modified time: 2024-07-25 15:59:34
"""


class ModuleInst:
    def __init__(self, name: str) -> None:
        self.name = name
        self.module_name = None
        self.port_list = {}
        self.parameter_list = {}

    def addPort(self, name: str, value: str):
        self.port_list[name] = value

    def addParameter(self, name: str, value: str):
        self.parameter_list[name] = value

    def setModuleName(self, name: str):
        self.module_name = name

    def getInstName(self):
        return self.name

    def getModuleName(self):
        return self.module_name

    def getPort(self, name: str):
        return self.port_list[name]

    def getPortList(self):
        return self.port_list.keys()

    def getParameters(self):
        return self.parameter_list

    def hasParameters(self):
        return len(self.parameter_list) > 0
