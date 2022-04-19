`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   19:04:10 04/19/2022
// Design Name:   alu
// Module Name:   /csehome/matchy/Documents/logic-design-lab/alu_1bit/alu_test.v
// Project Name:  alu_1bit
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [1:0] Select;
	reg Mode;
	reg A;
	reg B;

	// Outputs
	wire Output;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.Select(Select),
		.Mode(Mode),
		.A(A),
		.B(B),
		.Output(Output)
	);

	integer i;

	initial begin
		for (i = 0; i < 32; i=i+1) begin
			assign {Mode, A, B, Select} = i[4:0];
			#10;
		end
	end

endmodule
