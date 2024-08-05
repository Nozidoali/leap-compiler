#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-06-28 23:14:20
Last Modified by: Hanyu Wang
Last Modified time: 2024-07-01 22:31:39
"""

from leap import run_with_logger, Netlist, readVerilog, Module, DFGraph, writeVerilog, writeVerilogAST

import argparse

parser = argparse.ArgumentParser(description="SystemVerilog code to BLIF netlist")
parser.add_argument("-i", "--input", type=str, help="input directory/verilog file", default="./examples/testcases/matrix.v")
parser.add_argument("-o", "--output", type=str, help="output file", default="./examples/testcases/matrix_out.v")
parser.add_argument("-p", "--print", action="store_true", help="print the AST", default=False)


@run_with_logger("rtl2ast.log")
def run(args):
    moduleName = args.input.split("/")[-1].split(".")[0]
    netlist: Netlist = readVerilog(args.input)
    module: Module = netlist.getModule(moduleName)
    dfg: DFGraph = module.dfg
    writeVerilog(netlist, args.output)
    if args.print:
        dotFileName = args.output.replace(".v", ".dot")
        writeVerilogAST(module, dotFileName)

if __name__ == "__main__":
    args = parser.parse_args()
    run(args)
