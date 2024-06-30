#!/usr/bin/env python
# -*- encoding=utf8 -*-

'''
Author: Hanyu Wang
Created time: 2024-06-28 23:14:20
Last Modified by: Hanyu Wang
Last Modified time: 2024-06-30 12:45:45
'''

from leap import run_with_logger, printVerilogAST

import argparse
parser = argparse.ArgumentParser(description="SystemVerilog code to BLIF netlist")
parser.add_argument("-i", "--input", type=str, help="input directory/verilog file")
parser.add_argument("-o", "--output", type=str, help="output file")

@run_with_logger("sv2blif.log")
def run(args):
    printVerilogAST(args.input, args.output)


if __name__ == "__main__":
    args = parser.parse_args()
    run(args)
