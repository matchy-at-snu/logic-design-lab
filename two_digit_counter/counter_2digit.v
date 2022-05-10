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
    output reg [3:0] dig1,
    output reg [3:0] dig0
    );


  always @(posedge clock)
  begin
    if (reset) begin
      dig1 <= 0;
      dig0 <= 0;
    end
    else begin
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
endmodule
