This project implements a Moore Finite State Machine (FSM) in SystemVerilog to detect the binary sequence 1011 from a serial input stream. 
The FSM uses five states (Zero, One, OneZero, OneZeroOne, and OneZeroOneOne) to track input progress, with an output signal (detector_out) that goes high only when the complete sequence is detected. 
The design includes a modular testbench with SystemVerilog classes that validate reset behavior, state transitions, and output logic using an interface-driven approach. 
This project demonstrates how a Moore FSM can reliably detect patterns in a synchronous digital system.
