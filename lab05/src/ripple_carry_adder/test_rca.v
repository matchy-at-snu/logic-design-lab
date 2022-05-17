`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   17:57:47 04/19/2022
// Design Name:   rca_2bit
// Module Name:   /csehome/matchy/Documents/logic-design-lab/ripple-carry_adder/test_rca.v
// Project Name:  ripple-carry_adder
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: rca_2bit
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_rca;

	// Inputs
	reg [1:0] A;
	reg [1:0] B;
	reg Cin;

	// Outputs
	wire Cout;
	wire [1:0] S;

	// Instantiate the Unit Under Test (UUT)
	rca_2bit uut (
		.A(A),
		.B(B),
		.Cin(Cin),
		.Cout(Cout),
		.S(S)
	);

	integer i, j;

	initial begin
		for (i = 0; i < 8; i=i+1) begin
			for (j = 0; j < 4; j=j+1) begin
				A = i[1:0];
				B = j[1:0];
				Cin = i[2];
				#10;
			end
		end
	end

endmodule
