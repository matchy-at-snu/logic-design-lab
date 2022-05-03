# Lab Report 06

For my own sanity, I implemented the gates using all positive logic (thus not minimizing cost at all).

## R-S latch

```verilog
module RSlatch(input R,
               input S,
               output Q,
               output Q_L);

  nor (Q_L, S, Q);
  nor (Q, R, Q_L);

endmodule
```

Additionally, I added 5ns delay to each gate in order to trigger racing in the simulation.

```verilog
module RSlatch(input R,
               input S,
               output Q,
               output Q_L);

  nor #5(Q_L, S, Q);
  nor #5(Q, R, Q_L);

endmodule
```

### Simulation (without delay)

![RS latch simulation without delay](img/lab06/20220503113138.png)

### Simulation (with gate delay = 5ns)

![RS latch simulation with race](img/lab06/20220503113722.png)

## Gated R-S latch

```verilog
module RSlatch_gated(input R,
                     input S,
                     input E,
                     output Q,
                     output Q_L);

  wire R_in;
  and(R_in, R, E);

  wire S_in;
  and(S_in, S, E);

  RSlatch RS(.R(R_in), .S(S_in), .Q(Q), .Q_L(Q_L));

endmodule
```

### Simulation

The first half showed that HOLD after RESET will trigerring racing. But with ENABLE present, in the second half, the INVALID period happend when ENABLE is low, thus had no effect and did not trigger racing.

![RS gated no racing](img/lab06/20220503122900.png)

## Oscillator

```verilog
module Oscillator(input E,
                  output F);
  wire tmp;
  and #0(tmp, E, F);
  not #20(F, tmp);

endmodule
```

![oscillator 20ns](img/lab06/20220503124654.png)

## Edge triggered R-S Flip-flop using above modules

```verilog
module RS_flipflop(input R,
                   input S,
                   input Clk,
                   output Q,
                   output Q_L);

  wire Clk_L;
  assign Clk_L = ~Clk;

  wire P, P_L;

  RSlatch_gated RS1(.R(R), .S(S), .E(Clk), .Q(P), .Q_L(P_L));

  RSlatch_gated RS2(.R(P_L), .S(P), .E(Clk_L), .Q(Q), .Q_L(Q_L));

endmodule
```

### Simulation

Observations:

1. `Q` and `Q_L` changes happen at negative edge (when `Clk` goes low)
2. Small glitch happened when `Clk` is high will be captured (1's catching problem)

![RS flipflop](img/lab06/20220503125850.png)

## Discussion

Comparison between different flip-flops:

* **RS flip-flop**: Update at **negative** clock edge. Behaves the same as RS latch (R1S0 -- reset, R0S0 -- Hold, R0S1 -- set); Still possible to have racing problem (since there can still be R1S1 input and if the invalid input occurs during clock period there will be racing); also has 1's catching problem.
* **D flip-flop**: Updates at **positive** clock edge. Completely prohibited R1S1 input by wiring an input `D_L` to `R` and `D` to `S` to the master gated RS latch (so that R and S will always be either 01 or 10, no longer having HOLD now). No 1's catching problem.
* **JK flip-flop**: Avoid R1S1 situation by defining R1S1 as "toggle", where the output changes from high to low and low to high periodically.
