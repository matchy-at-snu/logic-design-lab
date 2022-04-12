`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:\t11:18:24 04/05/2022
// Design Name:
// Module Name:\tmux_4_to_1
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
module mux_4_to_1_behavior(
	 input [3:0] I,
	 input A,
	 input B,
	 output Y
	);

	 wire [1:0] sel;
	 reg out;
	 assign sel = {A, B};
	 assign Y = out;

	always @(I or sel) begin
		case (sel)
			2'b00: out = I[0];
			2'b01: out = I[1];
			2'b10: out = I[2];
			2'b11: out = I[3];
		endcase
	end

endmodule
