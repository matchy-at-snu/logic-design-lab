`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:36:24 05/03/2022
// Design Name:   TDC_main
// Module Name:   /csehome/matchy/Documents/logic-design-lab/two-digit-counter/test_TCD.v
// Project Name:  two-digit-counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TDC_main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_TCD;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [6:0] digit1;
	wire [6:0] digit0;

	// Instantiate the Unit Under Test (UUT)
	TDC_main uut (
		.clock(clock), 
		.reset(reset), 
		.digit1(digit1), 
		.digit0(digit0)
	);
	
	always #10 clock=~clock;

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here
		reset = 0;
		#2000;

	end
      
endmodule

