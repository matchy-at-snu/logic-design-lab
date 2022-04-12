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

	not(N_D, NUM[0]);
	not(N_C, NUM[1]);
	not(N_B, NUM[2]);
	not(N_A, NUM[3]);
	
	nand 

endmodule
