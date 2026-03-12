# Alu_impl

![Language](https://img.shields.io/badge/HDL-VHDL-blue?style=flat-square) ![Tool](https://img.shields.io/badge/EDA-Quartus%20Prime-green?style=flat-square) ![Type](https://img.shields.io/badge/Type-Arithmetic%2F%20ALU-orange?style=flat-square)

> **Course:** ECE 380 - Digital logics

## Overview

How does a processor support multiple arithmetic and logic operations without dedicating separate hardware to each one?

**Design Category:** Arithmetic / ALU  
**HDL:** VHDL  
**EDA Tool:** Quartus Prime  
**Target FPGA:** Altera Cyclone V  

## Port Map

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| `operand_1` | in | 4-bit | Operand input1 |
| `operand_2` | in | 4-bit | Operand input2 |
| `sel` | in | 3-bit | operation selector |
| `Zero` | out | 1-bit | result is all zeros |
| `carry` | out | 1-bit | arithmetic overflow out of the MSB |
| `negative` | in | 1-bit | result's MSB is 1 (signed interpretation) |
| `output` | in | 4-bit | operation result |

### Entity Declaration

```vhdl
entity alu_impl is
  port (
    operand_1        : in    std_logic_vector(3 downto 0);
    operand_2        : in    std_logic_vector(3 downto 0);
    sel              : in    std_logic_vector(2 downto 0);
    Zero             : out   std_logic;
    carry            : out   std_logic;
    negative         : in    std_logic;
    output           : in    std_logic_vector(3 downto 0)
  );
end entity;
```

## Simulation & Testing

**Simulation Tool:** ModelSim

+(2^n-1 - 1)  to -(2^n-1)

## File Structure

```
src/
   alu.vhd
sim/
   waveform
```

## How to Run

1. Open **Quartus Prime** and create a new project
2. Add all `.vhd` source files
3. Set the top-level entity to `alu_impl`
4. Compile and check the RTL Viewer
5. Run testbench in **ModelSim**

---

*Generated as part of ECE 380 - Digital logics.*
