# Five-Stage Pipelined RISC-V Simulator

## Overview
This project implements a **cycle-accurate five-stage pipelined RISC-V simulator** in C++.  
It simulates the following pipeline stages:
- **IF (Instruction Fetch)**
- **ID (Instruction Decode)**
- **EX (Execute)**
- **MEM (Memory Access)**
- **WB (Write Back)**

The simulator supports:
- Instruction memory (`imem.txt`)
- Data memory (`dmem.txt`)
- Register file (`RFResult.txt`)
- State logging for each cycle (`StateResult_FS.txt`)
- Memory dumps after execution (`*_DMEMResult.txt`)

## Features
- Implements RISC-V base instructions: arithmetic (add, sub, xor, or, and), immediate (addi, xori, ori, andi), load/store, branch, and JAL.
- Handles **data hazards** using:
  - **Forwarding** (from MEM/WB stages)
  - **Stalling** (for load-use hazards)
- Handles **control hazards** (branches and jumps)
- HALT instruction (`1111111`) stops the simulation.
- Cycle-by-cycle **state tracing** (pipeline register contents, hazards, control signals).

## File Structure
- `imem.txt` → Instruction memory (input program in binary, 32-bit instructions split into 4 bytes).
- `dmem.txt` → Data memory initialization (input).
- `*_DMEMResult.txt` → Final state of memory after execution.
- `RFResult.txt` → Register file dump after each cycle.
- `StateResult_FS.txt` → Pipeline state after each cycle.
- `main.cpp` → Source code of the simulator.

## Compilation & Execution
```bash
g++ -std=c++11 -o simulator main.cpp
./simulator <path_to_memory_files>
```
If no path is provided, the program will prompt for input.

Example:
```bash
./simulator ./TestCases
```

## Input Files Format
- **imem.txt**: Contains binary strings of 8 bits per line (each line = 1 byte). 4 consecutive lines = 1 instruction.
- **dmem.txt**: Contains binary strings of 8 bits per line, representing memory contents.

## Output Files
- **StateResult_FS.txt**: Pipeline state at every cycle (useful for debugging hazards and forwarding).
- **RFResult.txt**: Register file state after each cycle.
- ***_DMEMResult.txt**: Memory dump after program finishes execution.

## Example Workflow
1. Place `imem.txt` and `dmem.txt` in the project folder or test case directory.
2. Compile and run the simulator.
3. Inspect `StateResult_FS.txt` for cycle-by-cycle pipeline state.
4. Inspect `RFResult.txt` to see register updates.
5. Inspect `*_DMEMResult.txt` to see final memory state.

## Future Enhancements
- Add support for more RISC-V instructions.
- Implement branch prediction for improved performance.
- Extend to superscalar or out-of-order pipeline simulation.

---
Developed as part of **Computer Architecture Project - Phase 2**.
