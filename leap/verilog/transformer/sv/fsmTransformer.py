#!/usr/bin/env python
# -*- encoding=utf8 -*-

'''
Author: Hanyu Wang
Created time: 2024-06-28 14:32:55
Last Modified by: Hanyu Wang
Last Modified time: 2024-07-01 15:18:55
'''

import logging

logger = logging.getLogger(__name__)

from lark import Transformer, v_args, Tree
from ...modules import *

import pygraphviz as pgv

class FSMTransformer(Transformer):
    
    def case_statement(self, items):
        fsm = FSM()
        expression = items[0]
        for item in items[1]:
            state, case_actions = item
            fsm.states.append(state)
            for action in case_actions[0]:
                if len(action) == 3:
                    # assignment
                    _, signal, value = action
                    if signal == "next_state":
                        fsm.transitions.setdefault(state, []).append((None, value))
                    elif signal == "out":
                        fsm.outputs[state] = value
                if len(action) == 1:
                    # if statement
                    _, condition, true_branch = action[0]
                    fsm.transitions.setdefault(state, []).append((condition, true_branch))
        return fsm
    
    def case_content(self, items):
        return items[0], items[1]
    
    def case_item(self, items):
        state = str(items[0].children[0])
        case_actions = items[1]
        return state, case_actions
    
    def case_action(self, items):
        return items
        
    def default_assignments(self, items):
        pass  # Ignore default assignments for now

    def writeFSMtoFile(self, filename: str):
        fsm = pgv.AGraph(directed=True)
        for state in self.states:
            fsm.addNode(state)
        for state, transitions in self.transitions.items():
            for condition, next_state in transitions:
                if condition is None:
                    fsm.add_edge(state, next_state)
                else:
                    fsm.add_edge(state, next_state, label=condition)
        
        fsm.write(filename)
