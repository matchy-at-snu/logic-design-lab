`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:20:18 04/26/2022
// Design Name:
// Module Name:    RSlatch_gated
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
module RSlatch_gated(input R,
                     input S,
                     input E,
                     output Q,
                     output Q_L);


  wire R_in;
  and(R_in, R, E);

  wire S_in;
  and(S_in, S, E);

  RSlatch RS(.R(R_in),.S(S_in),.Q(Q),.Q_L(Q_L));

endmodule
