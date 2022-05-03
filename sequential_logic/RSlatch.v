`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:19:40 04/26/2022
// Design Name:
// Module Name:    RSlatch
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
module RSlatch(input R,
               input S,
               output Q,
               output Q_L);

  nor (Q_L, S, Q);
  nor (Q, R, Q_L);

endmodule
