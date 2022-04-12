`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    07:16:58 04/12/2022
// Design Name:
// Module Name:    mux_4_to_1_structure
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
module mux_4_to_1_structure(
    input [3:0] I,
    input A,
    input B,
    input Y
    );

	wire [3:0] G;
	wire [1:0] T;

	not(T[0], A);
	not(T[1], B);

	nand(G[0], I[0], T[0], T[1]);
	nand(G[1], I[1], T[0], B);
	nand(G[2], I[2], A, T[1]);
	nand(G[3], I[3], A, B);

	nand(Y, G[0], G[1], G[2], G[3]);

endmodule
