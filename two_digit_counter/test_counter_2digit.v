`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   20:06:33 05/03/2022
// Design Name:   counter_2digit
// Module Name:   /csehome/matchy/Documents/logic-design-lab/two-digit-counter/test_counter_2digit.v
// Project Name:  two-digit-counter
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: counter_2digit
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_counter_2digit;

	// Inputs
	reg reset;
	reg clock;

	// Outputs
	wire [3:0] dig1;
	wire [3:0] dig0;

	// Instantiate the Unit Under Test (UUT)
	counter_2digit uut (
		.reset(reset),
		.clock(clock),
		.dig1(dig1),
		.dig0(dig0)
	);

  always #10 clock = ~clock;

	initial begin
		// Initialize Inputs
		reset = 1;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
    reset = 0;
    #830;

    reset = 1;
    #100;


    reset = 0;
    #1000;

	end

endmodule
