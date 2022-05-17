`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   19:00:34 05/03/2022
// Design Name:   Counter
// Module Name:   /csehome/matchy/Documents/logic-design-lab/two-digit-counter/test_Counter.v
// Project Name:  two-digit-counter
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_counter1digit();

	// Inputs
	reg R;
	reg Clk;

	// Outputs
	wire [3:0] O;

	// Instantiate the Unit Under Test (UUT)
	counter_1digit uut (
		.R(R),
		.Clk(Clk),
		.O(O)
	);

	always #20 Clk=~Clk;

	initial begin
		// Initialize Inputs
		R = 1;
		Clk = 0;
		#100;

		R = 0;
		// Wait 100 ns for global reset to finish
		#5000;
		R = 1;
		#100;

	end

endmodule
