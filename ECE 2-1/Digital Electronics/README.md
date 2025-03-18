# Boolean Expression POS to Verilog Implementation

This project demonstrates the implementation of a 5-variable Boolean expression in **Product of Sum (POS)** form using **Verilog HDL**. The expression is first simplified using a **Karnaugh Map (K-map)** and then implemented using three different modeling styles: **gate-level**, **data flow**, and **behavioral modeling**. A comprehensive test bench is also provided to verify the correctness of the design.


## Project Overview

The Boolean expression `F(a,b,c,d,g) = Π(2,4,7,13,19,24,26)` represents a function where the output `F` is `0` for specific input combinations (maxterms). The project involves:

1. **Truth Table Creation**: Mapping all possible input combinations to their corresponding outputs.
2. **K-map Simplification**: Reducing the expression to its simplest form for efficient implementation.
3. **Verilog Implementation**: Writing the logic in Verilog using three modeling styles:
   - **Gate-Level Modeling**: Using basic logic gates (AND, OR, NOT).
   - **Data Flow Modeling**: Using continuous assignments (`assign` statements).
   - **Behavioral Modeling**: Using procedural blocks (`always` and `case` statements).
4. **Verification**: Testing the design using a test bench to ensure correctness.


## Simplified Boolean Expression

After simplifying the expression using a K-map, the minimized POS form is:
F = (a'+b'+c+g) * (a'+b+c+d'+g') * (a+b+c+d'+g) * (a+b+c'+d'+g') * (a+b'+c'+d+g') * (a+b+c'+d+g)


Here, `a'`, `b'`, `c'`, `d'`, and `g'` denote the **complements** of the variables `a`, `b`, `c`, `d`, and `g`, respectively.


## Implementation Styles

### 1. Gate-Level Modeling
This approach directly implements the Boolean expression using basic logic gates. It is the most hardware-oriented style and closely mirrors the physical circuit.

### 2. Data Flow Modeling
This style uses **continuous assignments** to describe how data flows through the circuit. It is more abstract than gate-level modeling but still closely tied to the logical structure of the design.

### 3. Behavioral Modeling
This is the highest level of abstraction, focusing on the **behavior** of the circuit rather than its specific logic gates. It uses procedural constructs like `always` blocks and `case` statements to describe functionality.



## Files Structure
Boolean-Expression-POS-to-Verilog/
- gate_level.v # Gate-level implementation
- data_flow.v # Data flow implementation
- behavioral.v # Behavioral implementation
- testbench.v # Test bench for verification
- docs/ # Project documentation
- README.md # Project overview


## Simulation Results

The simulation results confirm:
- **Correct output values** for all input combinations.
- **Proper timing behavior** of the circuit.
- Verification of **maxterms** (positions 2, 4, 7, 13, 19, 24, 26 showing output `F=0`).


## Requirements

To run this project, you need:
- A **Verilog HDL simulator** (e.g., ModelSim, Xilinx Vivado, or Icarus Verilog).
- Basic understanding of **Boolean algebra** and **K-maps**.
- Knowledge of **Verilog HDL**.


## Documentation

The project includes:
- Detailed **truth table**.
- Step-by-step **K-map simplification process**.
- **Circuit diagrams** for gate-level implementation.
- **Timing diagrams** and **simulation results**.


## Contributors

- **Md. Abu Hanif Khan** - Primary contributor and implementer.
- **Dr. Pallab Kumar Choudhury** - Project guide.
- **Naymur Rahman** - Project guide.


## Course Information

- **Course**: ECE-2104
- **Institution**: Khulna University of Engineering & Technology (KUET)
- **Department**: Electronics and Communication Engineering

