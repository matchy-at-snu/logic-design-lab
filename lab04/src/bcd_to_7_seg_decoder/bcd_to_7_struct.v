`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:25:39 04/12/2022
// Design Name:
// Module Name:    bcd_to_7_struct
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
module bcd_to_7_struct(
    input [3:0] NUM,
    output [6:0] SEG
    );

	wire A, B, C, D;
	wire N_A, N_B, N_C, N_D;

	assign D = NUM[0];
	assign C = NUM[1];
	assign B = NUM[2];
	assign A = NUM[3];

	not(N_D, NUM[0]);
	not(N_C, NUM[1]);
	not(N_B, NUM[2]);
	not(N_A, NUM[3]);

	wire [15:0] M;

	assign M[0] = N_A;
	nand (M[1], B, D);
	assign M[2] = N_C;
	nand (M[3], N_B, N_D);
	nand (M[4], N_C, N_D);
	nand (M[5], C, D);
	assign M[6] = B;
	assign M[7] = N_B;
	assign M[8] = C;
	assign M[9] = N_D;
	nand (M[10], B, N_C, D);
	nand (M[11], N_B, C);
	nand (M[12], B, N_C);
	nand (M[13], C, N_D);

	// C0
	nand (SEG[6], M[0], M[1], M[2], M[3]);

	// C1
	nand (SEG[5], M[4], M[5], M[6]);

	// C2
	nand (SEG[4], M[7], M[8], M[9]);

	// C3
	nand (SEG[3], M[0], M[3], M[13], M[10], M[11]);

	// C4
	nand (SEG[2], M[3], M[13]);

	// C5
	nand (SEG[1], M[0], M[7], M[4]);

	// C6
	nand (SEG[0], M[0], M[13], M[11], M[12]);

endmodule
