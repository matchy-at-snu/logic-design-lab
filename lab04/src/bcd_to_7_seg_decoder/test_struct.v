`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   08:43:01 04/12/2022
// Design Name:   bcd_to_7_struct
// Module Name:   /home/ise/_ise_projects/bcd_to_7_seg_decoder/test_struct.v
// Project Name:  bcd_to_7_seg_decoder
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: bcd_to_7_struct
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_struct;

	// Inputs
	reg [3:0] NUM;

	// Outputs
	wire [6:0] SEG;

	// Instantiate the Unit Under Test (UUT)
	bcd_to_7_struct uut (
		.NUM(NUM),
		.SEG(SEG)
	);

	integer i;

	initial begin 
		// Initialize Inputs
		for (i = 0; i < 16; i = i+1) begin
			NUM = i;
			#10;
		end

	end

endmodule
