#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-07-01 13:14:40
Last Modified by: Hanyu Wang
Last Modified time: 2024-07-01 20:28:12
"""

from .expression import *


class Assignment:

    def __init__(self, target, expression, condition=None) -> None:
        self.target = target
        self.expression = expression
        self.condition = condition

    def setCondition(self, condition):
        self.condition = condition

    def __repr__(self) -> str:
        return f"{self.target} = {self.expression} ({self.condition})"
