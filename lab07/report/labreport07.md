# Lab Report 07

In this week's lab session we implemented a Two Digit Counter (TDC) in `Verilog` and instantiated it onto the FPGA board.

## Lab Session: Counter Module

During the lab session, we implemented a two-digit counter. Starting from `00`, the two-bit counter will print two-digit numbers every second with an incremental of `1`. When the number hits `99`, it will go back to `00` and start over. Additionally, the counter has a reset button, which will set the counter back to `00` when the input is `HIGH`.

### Code

`always @(posedge clock or posedge reset)` is to make sure RESET is triggered asynchronously.

```verilog
module counter_2digit(
    input reset,
    input clock,
    output reg [3:0] dig1,
    output reg [3:0] dig0
    );

  always @(posedge clock or posedge reset)
  begin
    if (reset) begin
      dig1 <= 0;
      dig0 <= 0;
    end
    else begin
      always @(posedge clock)
      begin
        if (dig1 == 9 && dig0 == 9) begin
          dig1 <= 0;
          dig0 <= 0;
        end
        else if (dig0 == 9) begin
          dig0 <= 0;
          dig1 <= dig1 + 1;
        end
        else begin
          dig0 <= dig0 + 1;
        end
      end
    end
  end

```

### Simulation

#### Normal Increment

This screenshot shows that the counter can normally increase in the course of time.

![normal increment](img/lab07/20220510171107.png)

#### Start Over

This screenshot shows that the counter can restart from `00` when it reaches `99` (i.3. `dig1 == 4b'1001; dig0 == 4b'1001`).

![start over](img/lab07/20220510171213.png)

#### Reset

This screenshot shows that the counter can be reset *asynchronously* when the input `reset` is HIGH.

![reset](img/lab07/20220510171404.png)

## TDC module

The schematic of the TDC module is shown below.

![TDC](img/lab07/20220510172105.png)

### TDC_main

```verilog
module TDC_main(
    input clock,
    input stop,
    input reset,
    output [6:0] digit1,
    output [6:0] digit0
    );

  wire clock_sec;

  freq_divider fd(
    .clr(stop), .clk(clock), .clkout(clock_sec)
  );

  wire [3:0] dig1;
  wire [3:0] dig0;

  counter_2digit cnt(
    .reset(reset),
    .clock(clock_sec),
    .dig1(dig1),
    .dig0(dig0)
  );

  bcd_to_7 show1(
    .bcd(dig1), .seg(digit1)
  );
  bcd_to_7 show2(
    .bcd(dig0), .seg(digit0)
  );


endmodule
```
