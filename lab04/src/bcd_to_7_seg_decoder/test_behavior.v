`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   15:19:58 04/19/2022
// Design Name:   bcd_to_7_behavior
// Module Name:   /csehome/matchy/Documents/logic-design-lab/bcd_to_7_seg_decoder/test_behavior.v
// Project Name:  bcd_to_7_seg_decoder
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: bcd_to_7_behavior
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_behavior;

	// Inputs
	reg [3:0] NUM;

	// Outputs
	wire [6:0] SEG;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	bcd_to_7_behavior uut (
		.NUM(NUM),
		.SEG(SEG)
	);

	initial begin
		// Initialize Inputs
		for (i = 0; i < 16; i = i+1) begin
			NUM = i;
			#10;
		end
	end

endmodule
