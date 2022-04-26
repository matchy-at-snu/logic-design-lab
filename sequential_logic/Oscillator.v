`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:21:01 04/26/2022
// Design Name:
// Module Name:    Oscillator
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
module Oscillator(input E,
                  inout F);
  wire tmp;
  and #0(tmp, E, F);
  not #10(F, tmp);
  
endmodule
