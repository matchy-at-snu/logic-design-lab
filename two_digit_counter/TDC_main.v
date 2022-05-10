`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:22:50 05/03/2022
// Design Name:
// Module Name:    TDC_main
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module TDC_main(
    input clock,
    input reset,
    output [6:0] digit1,
    output [6:0] digit0
    );

  wire clock_sec;

  freq_divider fd(
    .clr(reset), .clk(clock), .clkout(clock_sec)
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
