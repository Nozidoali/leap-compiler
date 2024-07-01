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
        return items

    def statement(self, items):
        return [items[0]]

    # conditional_statement: if_statement else_if_statements? else_statement?
    def conditional_statement(self, items):
        for item in items:
            ctype, condition, statements = item
        return items

    def if_statement(self, items):
        return ConditionalType.IF, items[0], items[1]
    
    def else_if_statements(self, items):
        return ConditionalType.ELSE_IF, items[0], items[1]
    
    def else_statement(self, items):
        return ConditionalType.ELSE, None, items[0]