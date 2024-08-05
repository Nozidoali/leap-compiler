#!/usr/bin/env python
# -*- encoding=utf8 -*-

"""
Author: Hanyu Wang
Created time: 2024-05-22 14:49:16
Last Modified by: Hanyu Wang
Last Modified time: 2024-05-22 14:49:30
"""

from .blif import *


def write_blif_to_string(g: BLIFGraph) -> str:
    """
    write the blif to a string
    """

    blif_string = "# Generated by MADBuf\n"

    if g.top_module is None or g.top_module == "":
        g.top_module = "unknown"

    blif_string += ".model " + g.top_module + "\n"
    blif_string += ".inputs "
    for input in g.pis():
        blif_string += input + " "
    blif_string += "\n"
    blif_string += ".outputs "
    for output in g.pos():
        blif_string += output + " "
    blif_string += "\n"
    for ro in g.ro_to_ri:
        blif_string += ".latch\t" + g.ro_to_ri[ro] + " " + ro + " 2\n"
    for node in g.constant0s():
        blif_string += ".names\t" + node + "\n0\n"
    for node in g.constant1s():
        blif_string += ".names\t" + node + "\n1\n"
    for node in g.get_nodes():
        blif_string += ".names\t"
        for fanin in g.fanins(node):
            blif_string += fanin + " "
        blif_string += node + "\n"
        for truth_table in g.node_funcs[node]:
            blif_string += truth_table + "\n"
    blif_string += ".end\n"

    return blif_string


def write_blif(g: BLIFGraph, filename: str):
    """
    write the blif to a file
        TODO:
            - consider also the blackboxes
    """

    f = open(filename, "w")
    f.write(write_blif_to_string(g))
    f.close()