#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-25 23:20:52
Last Modified by: Hanyu Wang
Last Modified time: 2024-06-25 23:22:01
"""

import logging

logger = logging.getLogger(__name__)

from lark import Transformer, v_args, Tree
from ...modules import *

from enum import Enum, auto

class ConditionalType(Enum):
    IF = auto()
    ELSE_IF = auto()
    ELSE = auto()

class StatementTransformer(Transformer):
    def single_statement(self, items):
        return [items[0]]

    def statement_block(self, items):
        all_items = []
        for item in items:
            if isinstance(item, list):
                all_items.extend(item)
            else:
                all_items.append(item)
        return all_items

    # statement: variable_assignment ";"
    #             | conditional_statement
    #             | case_statement
    #             | system_task
    def statement(self, items):
        if isinstance(items[0], list):
            return items[0]
        return [items[0]]

    # conditional_statement: if_statement else_if_statements? else_statement?
    def conditional_statement(self, items):
        # we need to flatten the list
        all_items = []
        for branches in items:
            for statement in branches:
                if isinstance(statement, list):
                    all_items.extend(statement)
                else:
                    all_items.append(statement)
        return all_items

    def if_statement(self, items):
        return items[1]
    
    def else_if_statements(self, items):
        return items[1]
    
    def else_statement(self, items):
        return items[0]