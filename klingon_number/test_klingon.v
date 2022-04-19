`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   15:49:26 04/19/2022
// Design Name:   klingon_structural
// Module Name:   /csehome/matchy/Documents/logic-design-lab/klingon_number/test_klingon.v
// Project Name:  klingon_number
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: klingon_structural
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_klingon;

	// Inputs
	reg [3:0] NUM;

	// Outputs
	wire [6:0] SEG1;
	wire [6:0] SEG2;
	wire [6:0] SEG3;

	// Instantiate the Unit Under Test (UUT)
	klingon_structural uut1 (
		.NUM(NUM),
		.SEG(SEG1)
	);

	klingon_behavior uut2 (
		.NUM(NUM),
		.SEG(SEG2)
	);

	klingon_dataflow uut3 (
		.NUM(NUM),
		.SEG(SEG3)
	);

	localparam [0:(7*10)-1] ref_results = {
		7'b1111110,
		7'b1000000,
		7'b1000001,
		7'b1001001,
		7'b0100011,
		7'b0011101,
		7'b0100101,
		7'b0010011,
		7'b0110110,
		7'b0110111
	};

	reg [6:0] ref;

	integer i;

	wire correct_struct = (ref == SEG1);
	wire correct_behavior = (ref == SEG2);
	wire correct_dataflow = (ref == SEG3);

	initial begin
		for (i = 0; i < 10; i=i+1) begin
			NUM = i;
			ref = ref_results[i*7+:7];
			#20;
		end

	end

endmodule
