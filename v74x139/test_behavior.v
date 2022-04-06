`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:18:41 04/05/2022
// Design Name:   v74x139_behavior
// Module Name:   /home/ise/_ise_projects/v74x139/test_behavior.v
// Project Name:  v74x139
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: v74x139_behavior
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
	reg G_L;
	reg A;
	reg B;

	// Outputs
	wire [3:0] Y_L;

	// Instantiate the Unit Under Test (UUT)
	v74x139_behavior uut (
		.G_L(G_L), 
		.A(A), 
		.B(B), 
		.Y_L(Y_L)
	);

	initial begin
		G_L = 0; A = 0; B = 0;
		#100;
      
		G_L = 0; A = 0; B = 1;
		#100;
		
		G_L = 0; A = 1; B = 0;
		#100;
		
		G_L = 0; A = 1; B = 1;
		#100;
		
		G_L = 1; A = 0; B = 0;
		#100;
		
		G_L = 1; A = 0; B = 1;
		#100;
		
		G_L = 1; A = 1; B = 0;
		#100;
		
		G_L = 1; A = 1; B = 1;
	end
      
endmodule

