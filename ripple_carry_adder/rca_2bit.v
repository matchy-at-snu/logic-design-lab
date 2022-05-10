`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:52:29 04/19/2022
// Design Name:
// Module Name:    rca_2bit
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
module rca_2bit(
    input [1:0] A,
    input [1:0] B,
    input Cin,
    output Cout,
    output [1:0] S
    );

wire C;

full_adder_1bit FA1(
	.A(A[0]), .B(B[0]), .Cin(Cin), .Cout(C), .Sum(S[0])
);

full_adder_1bit FA2(
	.A(A[1]), .B(B[1]), .Cin(C), .Cout(Cout), .Sum(S[1])
);

endmodule
