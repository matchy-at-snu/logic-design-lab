`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   06:11:48 04/12/2022
// Design Name:   decoder_3_to_8
// Module Name:   /home/ise/_ise_projects/decoder_3_to_8/test_3_to_8.v
// Project Name:  decoder_3_to_8
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: decoder_3_to_8
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_3_to_8;

	// Inputs
	reg G;
	reg [2:0] SEL;

	// Outputs
	wire [7:0] OUT;

	integer i;

	// Instantiate the Unit Under Test (UUT)
	decoder_3_to_8 uut (
		.G(G),
		.SEL(SEL),
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		for (i = 0; i < 16; i = i + 1) begin
			G = (i >> 3) & 1;
			SEL[2] = (i >> 2) & 1;
			SEL[1] = (i >> 1) & 1;
			SEL[0] = i & 1;
			#10;
		end

	end

endmodule
