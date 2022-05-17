`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    04:57:34 04/12/2022
// Design Name:
// Module Name:    decoder_2_to_4
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
module decoder_2_to_4(
	input G,
	input S0,
	input S1,
	output [3:0] O
	);

	wire [1:0] sel;
	reg [3:0] out;

	assign sel = {S1, S0};
	assign O = out;

	always@(G or sel)
	begin
		if (G == 1'b1) begin
			case(sel)
				2'b00: out = 4'b0001;
				2'b01: out = 4'b0010;
				2'b10: out = 4'b0100;
				2'b11: out = 4'b1000;
			endcase
		end
		else begin
			out = 4'b0000;
		end

	end

endmodule
