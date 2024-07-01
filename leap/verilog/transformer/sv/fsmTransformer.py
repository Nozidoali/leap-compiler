#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-28 14:32:55
Last Modified by: Hanyu Wang
Last Modified time: 2024-07-01 18:14:53
"""

import logging

logger = logging.getLogger(__name__)

from lark import Transformer, v_args, Tree
from ...modules import *

import pygraphviz as pgv


class FSMTransformer(Transformer):

    def case_statement(self, items):
        expression = items[0]
        caseBody = items[1]
        return caseBody

    def case_content(self, items):
        return items

    def case_item(self, items):
        state = str(items[0].children[0])
        case_actions = items[1]
        return case_actions

    # ?case_action: statement_block | single_statement
    def case_action(self, items):
        return items

    def default_assignments(self, items):
        pass  # Ignore default assignments for now
