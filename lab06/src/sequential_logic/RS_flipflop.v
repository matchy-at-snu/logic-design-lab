`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:22:33 04/26/2022
// Design Name:
// Module Name:    RS_flipflop
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
module RS_flipflop(input R,
                   input S,
                   input Clk,
                   output Q,
                   output Q_L);

  wire Clk_L;
  assign Clk_L = ~Clk;

  wire P, P_L;

  RSlatch_gated RS1(.R(R), .S(S), .E(Clk), .Q(P), .Q_L(P_L) );

  RSlatch_gated RS2(.R(P_L), .S(P), .E(Clk_L), .Q(Q), .Q_L(Q_L));

endmodule
