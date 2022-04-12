`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:53 04/05/2022 
// Design Name: 
// Module Name:    v74x139 
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
module v74x139(
    input G1,
    input G2,
    input B1,
    input B2,
    input A1,
    input A2,
    output [3:0] Y1,
    output [3:0] Y2
    );
	 
	v74x139_structural T1(.G_L(G1), .A(A1), .B(B1), .Y_L(Y1));
	v74x139_behavior T2(.G_L(G2), .A(A2), .B(B2), .Y_L(Y2));

endmodule
