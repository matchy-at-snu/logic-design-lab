`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:48:41 04/26/2022
// Design Name:   RSlatch_gated
// Module Name:   /csehome/matchy/Documents/logic-design-lab/sequential_logic/test_gateRSlatch.v
// Project Name:  sequential_logic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RSlatch_gated
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_gateRSlatch;

	// Inputs
	reg R;
	reg S;
	reg E;

	// Bidirs
	wire Q;
	wire Q_L;

	// Instantiate the Unit Under Test (UUT)
	RSlatch_gated uut (
		.R(R), 
		.S(S), 
		.E(E), 
		.Q(Q), 
		.Q_L(Q_L)
	);

	initial begin
		// Initialize Inputs
		R = 0;
		S = 0;
		E = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

