`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:42:03 05/17/2022
// Design Name:
// Module Name:    vm_main
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
module vm_main(
    input N,
    input D,
    input RESET,
    input CLK,
    output [6:0] D1,
    output [6:0] D0,
    output release,
    );

  wire clock_sec;

  freq_divider fd(
    .clr(0), .clk(CLK), .clkout(clock_sec)
  );

  wire [3:0] state;
  wire [3:0] dig1;
  wire [3:0] dig0;

  vm_moore core(
    .RESET(RESET), .CLK(clock_sec), .N(N), .D(D), .State(state), .O(release)
  )

  if (state == 4'b0001) begin
    dig1 = 4'b0000;
    dig0 = 4'b0000;
  end else if (state == 4'b0010) begin
    dig1 = 4'b0000;
    dig0 = 4'b0101;
  end else if (state == 4'b0100) begin
    dig1 = 4'b0001;
    dig0 = 4'b0000;
  end else begin
    dig1 = 4'b0001;
    dig0 = 4'b0101;
  end

  bcd_to_7 show1(
    .bcd(dig1), .seg(D1)
  );
  bcd_to_7 show0(
    .bcd(dig0), .seg(D0)
  );
endmodule
