# VHDL Square Root Calculator

## Overview
This repository contains a VHDL implementation of an 8-bit integer square root calculator using a finite state machine (FSM), based on an Algorithmic State Machine (ASM) chart. It includes both design and testbench code for training evaluation.

## Repository Name
**Suggested Repository Name**: `VHDL-SquareRoot`

## Files
- **design.vhd**: Main VHDL file with entity `SQR` and a behavioral architecture using states `T_Initial`, `T0`, `T1`, `T2`, `T3`, and `T4`. This is the core design code for the square root calculator.
- **testbench.vhd**: Testbench that simulates all 8-bit inputs (0-255) with a 4 ns clock period and reset/start signals. This is provided for verifying the design.
- **images/asm_chart.png** (optional): Visual ASM chart of the square root algorithm.

## ASM Chart Summary
- **T0**: Initializes with `a = X`, `q = 1`, `d = 3` when `S = 1`.
- **T1**: Updates `q = q + d`.
- **T2**: Increments `d = d + 2`.
- **Decision**: If `q > a`, moves to `T3`; otherwise, loops to `T1`.
- **T3**: Shifts `d` right (SHR).
- **T4**: Outputs `sqrt = d - 1`.

## Usage
- **Simulation**: Use a VHDL simulator (e.g., ModelSim, Vivado) with `design.vhd` and `testbench.vhd` to evaluate the implementation.
- **Synthesis**: Compatible with FPGA/ASIC, requiring IEEE libraries (`std_logic_1164`, `std_logic_unsigned`).

## Notes
- Input `X` must be non-negative.
- Output `Sqrt` is the integer square root (floor value).
- The FSM ensures proper sequencing of the algorithm.
- The design and testbench are included for training assessment purposes.

## Author
- Ali Odeh (ID: 12112361)
