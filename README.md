# Traffic Light Controller using FSM (Verilog)

## Overview

This project implements a Traffic Light Controller using a Finite State Machine (FSM) in Verilog HDL. I developed this project while learning sequential circuit design to better understand how FSM concepts are translated into hardware implementation.

The controller manages three traffic light signals: RED, GREEN, and YELLOW, and transitions in the following sequence:

RED → GREEN → YELLOW → RED

The design is synchronous and operates on the positive edge of the clock with an active-high reset.

---

## FSM Type

This implementation follows the **Moore FSM model**.

- The outputs depend only on the current state.
- Each state directly determines which light is active.
- The outputs do not depend on external input signals.

Since the traffic lights change only when the state changes, the design qualifies as a Moore machine.

---

## Design Description

### 1. State Register
- Stores the current state (S0, S1, S2).
- Updates on every positive clock edge.
- Initializes to the RED state when reset is active.

### 2. Counter
- Controls how long each state remains active.
- RED and GREEN states remain active for a fixed number of clock cycles.
- YELLOW remains active for a shorter duration.

### 3. State Transition Logic
- When the counter reaches its predefined limit, the FSM transitions to the next state.
- The counter resets during each state transition.

---

## Verification and Output

A separate testbench was written to verify the design.

- The clock and reset signals are generated in the testbench.
- State transitions are simulated over multiple cycles.
- The traffic light outputs are displayed in the console window using `$monitor`, allowing real-time observation of state changes.
- Waveforms were observed to confirm correct timing behavior.

---

## Learning Outcomes

Through this project, I gained practical understanding of:

- Moore finite state machine design
- Synchronous sequential logic
- Counter-based timing control
- Writing and simulating Verilog testbenches
- Debugging digital circuits using console output and waveform analysis

This project strengthened my fundamentals in digital system design and FSM implementation using Verilog HDL.
