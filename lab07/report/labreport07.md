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

![reset](img/lab07/20220510175144.png)

## TDC module

The schematic of the TDC module is shown below.

![TDC](img/lab07/20220510172105.png)

### Code

The code for Counter is the same as the implementation shown in above in [Lab Session: Counter Module](#lab-session-counter-module).

#### Frequency divider

```verilog
module freq_divider(
    input clr,
    input clk,
    output reg clkout
    );

  reg[31:0] cnt;

  always @(posedge clk) begin
    if (clr) begin
        cnt <= 32'd0;
        clkout <= 1'b0;
    end
    else if (cnt == 32'd25000000) begin
        cnt <= 32'd0;
        clkout <= ~clkout;
    end
    else begin
        cnt <= cnt + 1;
    end
  end

endmodule
```

#### BCD to 7-segment decoder

```verilog
module bcd_to_7(
    input [3:0] bcd,
    output reg [6:0] seg
    );

  always @(bcd) begin
    case(bcd)
      4'd0: seg <= 7'b0111111;
      4'd1: seg <= 7'b0000110;
      4'd2: seg <= 7'b1011011;
      4'd3: seg <= 7'b1001111;
      4'd4: seg <= 7'b1100110;
      4'd5: seg <= 7'b1101101;
      4'd6: seg <= 7'b1111101;
      4'd7: seg <= 7'b0000111;
      4'd8: seg <= 7'b1111111;
      4'd9: seg <= 7'b1101111;
    endcase
  end

endmodule
```

#### TDC_main

Note that to allow the clock to be stopped and the counter the be reset, `TDC_main` accepts 3 inputs: `clock`, `stop` and `reset`. The input `clock` is wire to a 50MHz oscillator and is passed to the frequency divider to make a 1Hz clock. The input `stop` will set the internal clock (here `clock_sec`) to `0` and pause the counter when it's HIGH. The input `reset` will reset the counter when it's HIGH (but it will not stop the internal clock).

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

### Implementation

With the presence of the frequency divider, it is very difficult to simulate the waveform.

#### Normal Increment

![](img/lab07/20220510174101.png)
![](img/lab07/20220510174140.png)
![](img/lab07/20220510174152.png)
![](img/lab07/20220510174209.png)

#### Start Over

![](img/lab07/20220510174233.png)
![](img/lab07/20220510174246.png)

#### Reset

![](img/lab07/20220510174302.png)
![](img/lab07/20220510174311.png)

## Discussion

In the discussion, I'm going to mention some mistakes I made during the implementation process.

### Mistakes Made
