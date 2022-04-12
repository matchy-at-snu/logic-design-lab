`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   05:37:58 04/12/2022
// Design Name:   decoder_2_to_4
// Module Name:   /home/ise/_ise_projects/decoder_3_to_8/test_2_to_4.v
// Project Name:  decoder_3_to_8
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: decoder_2_to_4
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// S0dditional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_2_to_4;

	// Inputs
	reg G;
	reg S0;
	reg S1;

	// Outputs
	wire [3:0] O;

	// Instantiate the Unit Under Test (UUT)
	decoder_2_to_4 uut (
		.G(G),
		.S0(S0),
		.S1(S1),
		.O(O)
	);

	initial begin
		G = 0; S0 = 0; S1 = 0;
		#100;

		G = 0; S0 = 0; S1 = 1;
		#100;

		G = 0; S0 = 1; S1 = 0;
		#100;

		G = 0; S0 = 1; S1 = 1;
		#100;

		G = 1; S0 = 0; S1 = 0;
		#100;

		G = 1; S0 = 0; S1 = 1;
		#100;

		G = 1; S0 = 1; S1 = 0;
		#100;

		G = 1; S0 = 1; S1 = 1;
	end

endmodule
