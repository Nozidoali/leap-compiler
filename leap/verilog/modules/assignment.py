#!/usr/bin/env python
# -*- encoding=utf8 -*-

'''
Author: Hanyu Wang
Created time: 2024-07-01 13:14:40
Last Modified by: Hanyu Wang
Last Modified time: 2024-07-01 13:15:23
'''

class Assignment:
    
    def __init__(self) -> None:
        self.target = None
        self.expression = None
        self.condition = None
        
    def __repr__(self) -> str:
        return f"{self.target} = {self.expression}"