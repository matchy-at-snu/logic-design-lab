`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   11:22:09 04/05/2022
// Design Name:   mux_4_to_1
// Module Name:   /home/ise/_ise_projects/mux/test_mux.v
// Project Name:  mux
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: mux_4_to_1
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_mux;

	// Inputs
	reg [3:0] I;
	reg A;
	reg B;

	// Outputs
	wire Y;

	integer i;

	// Instantiate the Unit Under Test (UUT)
	mux_4_to_1 uut (
		.I(I),
		.A(A),
		.B(B),
		.Y(Y)
	);

	initial begin
		for (i = 0; i < 64; i = i + 1) begin
			I[0] = i & 1;
			I[1] = (i >> 1) & 1;
			I[2] = (i >> 2) & 1;
			I[3] = (i >> 3) & 1;
			B = (i >> 4) & 1;
			A = (i >> 5) & 1;
			#10;
      end

	end

endmodule
