`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: out =
// Engineer: out =
//
// Create Date: out =    15:48:56 04/19/2022
// Design Name: out =
// Module Name: out =    klingon_behavior
// Project Name: out =
// Target Devices: out =
// Tool versions: out =
// Description: out =
//
// Dependencies: out =
//
// Revision: out =
// Revision 0.01 - File Created
// Additional Comments: out =
//
//////////////////////////////////////////////////////////////////////////////////
module klingon_behavior(
    input [3:0] NUM,
    output [6:0] SEG
    );

	wire [3:0] in;
	assign in = NUM;
	reg [6:0] out;
	assign SEG = out;

	always @(in) begin
		case (in)
			4'b0000: out = 7'b1111110;
			4'b0001: out = 7'b1000000;
			4'b0010: out = 7'b1000001;
			4'b0011: out = 7'b1001001;
			4'b0100: out = 7'b0100011;
			4'b0101: out = 7'b0011101;
			4'b0110: out = 7'b0100101;
			4'b0111: out = 7'b0010011;
			4'b1000: out = 7'b0110110;
			4'b1001: out = 7'b0110111;
			default:
				out = 7'b0000000;
		endcase
	end

endmodule
