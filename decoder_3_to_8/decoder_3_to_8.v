`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    05:46:27 04/12/2022
// Design Name:
// Module Name:    decoder_3_to_8
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
module decoder_3_to_8(
    input G,
    input [2:0] SEL,
    output [7:0] OUT
    );

	decoder_2_to_4 D1(.G(G & ~SEL[2]), .S0(SEL[0]), .S1(SEL[1]), .O(OUT[3:0]));
	decoder_2_to_4 D2(.G(G & SEL[2]), .S0(SEL[0]), .S1(SEL[1]), .O(OUT[7:4]));

endmodule
