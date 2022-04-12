`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:41:28 04/12/2022
// Design Name:   bcd_to_7
// Module Name:   /csehome/matchy/Documents/logic-design-lab/bcd_to_7_seg_decoder/test_dataflow.v
// Project Name:  bcd_to_7_seg_decoder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd_to_7_dataflow
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_dataflow;

	// Inputs
	reg [3:0] NUM;

	// Outputs
	wire [6:0] SEG;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	bcd_to_7_dataflow uut (
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

