#
# Copyright (c) 2018-2021 T. {Benz,Kramer}.
#
# This file is part of verilog-parser
# (see https://codeberg.org/tok/py-verilog-parser).
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
from lark import Lark

# http://www.verilog.com/VerilogBNF.html
# http://www.externsoft.ch/download/verilog.html

from .transformer import VerilogTransformer, SystemVerilogTransformer, Netlist


def parse_verilog(data: str, systemVerilog: bool = True) -> Netlist:
    """
    Parse a string containing data of a verilog file.
    :param data: Raw verilog string.
    :return:
    """
    import os

    curr_dir = os.path.dirname(os.path.abspath(__file__))
    grammar_file = (
        os.path.join(curr_dir, "systemverilog.lark")
        if systemVerilog
        else os.path.join(curr_dir, "verilog.lark")
    )
    with open(grammar_file, "r") as f:
        verilog_netlist_grammar = f.read()

    # select the transformer
    transformer = SystemVerilogTransformer() if systemVerilog else VerilogTransformer()

    verilog_parser = Lark(
        verilog_netlist_grammar,
        parser="lalr",
        lexer="contextual",
        transformer=transformer,
    )
    netlist = verilog_parser.parse(data)
    return netlist


# reference: https://codeberg.org/tok/py-verilog-parser/src/branch/master/verilog_parser/parser.py
def readVerilog(filename: str) -> Netlist:
    with open(filename, "r") as f:
        data = f.read()
    return parse_verilog(data)


def printVerilogAST(filename: str, textFile: str = None, systemVerilog: bool = True):
    import os
    from lark.tree import pydot__tree_to_png

    grammer = None
    curr_dir = os.path.dirname(os.path.abspath(__file__))
    grammar_file = (
        os.path.join(curr_dir, "systemverilog.lark")
        if systemVerilog
        else os.path.join(curr_dir, "verilog.lark")
    )
    with open(grammar_file, "r") as f:
        grammer = f.read()
    parser = Lark(grammer, parser="lalr", lexer="contextual")
    parseTree = parser.parse(open(filename).read())

    # transform = SystemVerilogTransformer() if systemVerilog else VerilogTransformer()
    # parseTree = transform.transform(parseTree)

    if textFile is not None:
        with open(textFile, "w") as f:
            f.write(str(parseTree.pretty()))
    else:
        print(parseTree.pretty())
    # pydot__tree_to_png(parseTree, pngFile)
