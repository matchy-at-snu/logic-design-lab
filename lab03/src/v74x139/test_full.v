`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   10:24:18 04/05/2022
// Design Name:   v74x139
// Module Name:   /home/ise/_ise_projects/v74x139/test_full.v
// Project Name:  v74x139
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: v74x139
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_full;

	// Inputs
	reg G1;
	reg G2;
	reg B1;
	reg B2;
	reg A1;
	reg A2;

	// Outputs
	wire [3:0] Y1;
	wire [3:0] Y2;

	integer i;

	// Instantiate the Unit Under Test (UUT)
	v74x139 uut (
		.G1(G1),
		.G2(G2),
		.B1(B1),
		.B2(B2),
		.A1(A1),
		.A2(A2),
		.Y1(Y1),
		.Y2(Y2)
	);

	initial begin
        for (i = 0; i < 64; i = i + 1) begin
            G1 = (i >> 5) & 1;
            G2 = (i >> 4) & 1;
            B1 = (i >> 3) & 1;
            B2 = (i >> 2) & 1;
            A1 = (i >> 1) & 1;
            A2 = i & 1;
            #10;
        end
	end

endmodule
