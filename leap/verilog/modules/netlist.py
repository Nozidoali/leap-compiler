#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-25 17:11:35
Last Modified by: Hanyu Wang
Last Modified time: 2024-06-25 22:59:35
"""


class Netlist:
    def __init__(self, modules: list):
        self.modules = modules[:]

    def __repr__(self):
        return "Netlist({})".format(self.modules)

    def getModule(self, name: str):
        for module in self.modules:
            if module.module_name == name:
                return module
        return None
