# EC413 Lab 7 – Single-Cycle MIPS CPU

This project extends a basic single-cycle MIPS CPU to support additional instructions and deepen understanding of CPU architecture. The design eliminates the need for pipeline registers and executes all operations within a single clock cycle.

## Features Implemented

- **ALU Instructions**: ADD, SUB, AND, OR, XOR, NOR, SLT, ADDI, ORI
- **Move**: LUI (Load Upper Immediate)
- **Memory Access**: LW, SW
- **Branching**: BNE (Branch if Not Equal)
- **Jumping**: J (Jump instruction)

## Key Modifications

- **ALU.v** and **ALU_control.v** updated to support SLT and I-format instructions
- **Control.v** updated to decode opcodes for I-type and branch instructions
- **Jump logic** implemented for correct target address computation and PC update
- **Testbench** extended to validate all supported instruction types

## Testing

The updated `cpu_tb.v` testbench includes test cases for:

- Arithmetic and logic operations
- Immediate operations (`ADDI`, `ORI`, `LUI`)
- Control flow (`J`, `BNE`)
- Memory access (`LW`, `SW`)
