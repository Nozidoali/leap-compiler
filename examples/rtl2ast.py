#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-28 23:14:20
Last Modified by: Hanyu Wang
Last Modified time: 2024-07-01 22:31:39
"""

from leap import run_with_logger, Netlist, readVerilog, Module, DFGraph

import argparse

parser = argparse.ArgumentParser(description="SystemVerilog code to BLIF netlist")
parser.add_argument("-i", "--input", type=str, help="input directory/verilog file")
parser.add_argument("-o", "--output", type=str, help="output file")


@run_with_logger("rtl2ast.log")
def run(args):
    netlist: Netlist = readVerilog(args.input)
    module: Module = netlist.getModule("toy")
    dfg: DFGraph = module.dfg
    dfg.toGraph(args.output)


if __name__ == "__main__":
    args = parser.parse_args()
    run(args)
