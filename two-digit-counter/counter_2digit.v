`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    19:55:08 05/03/2022
// Design Name:
// Module Name:    counter_2digit
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
module counter_2digit(
    input reset,
    input clock,
    output [3:0] dig1,
    output [3:0] dig0
    );

  reg [7:0] out;

  assign dig1 = out[7:4];
  assign dig0 = out[3:0];

  always @(posedge clock)
  begin
    if (reset) begin
      out <= 0;
    end
    else begin
      if (out == 99) begin
        out <= 0;
      end
      else begin
        out <= out + 1;
      end
    end
  end
endmodule
