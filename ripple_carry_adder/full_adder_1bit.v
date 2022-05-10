`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:54 04/19/2022 
// Design Name: 
// Module Name:    full_adder_1bit 
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
module full_adder_1bit(
    input A,
    input B,
    input Cin,
    output Cout,
    output Sum
    );

wire Sum_HA, C1, C2;
half_adder ha1(
	.A(A), .B(B), .Cout(C1), .Sum(Sum_HA)
);

half_adder ha2(
	.A(Cin), .B(Sum_HA), .Cout(C2), .Sum(Sum)
);

assign Cout = C1 | C2;

endmodule
