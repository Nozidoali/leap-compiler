LEAP
====

LEAP (logic network aware pipelining) is a tool for generating more performant pipelined circuits by taking into account the logic network of the circuit.

The core data structure LEAP uses to represent RTL is a graph (potentially cyclic) where each node is a logic/high-level operation and each edge is a wire (or a channel). 

The advantage of LEAP comparing to conventional pipelining tools is that it has **both** the high-level view of the circuit and the low-level view of the circuit. This allows LEAP to make more informed decisions about where to place pipeline registers and how to balance the pipeline stages.