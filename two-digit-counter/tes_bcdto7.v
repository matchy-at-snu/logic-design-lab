`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   14:27:37 05/10/2022
// Design Name:   bcd_to_7
// Module Name:   /csehome/matchy/Documents/logic-design-lab/two-digit-counter/tes_bcdto7.v
// Project Name:  two-digit-counter
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: bcd_to_7
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module tes_bcdto7;

	// Inputs
	reg [3:0] bcd;

	// Outputs
	wire [6:0] seg;

	// Instantiate the Unit Under Test (UUT)
	bcd_to_7 uut (
		.bcd(bcd),
		.seg(seg)
	);

  integer i;

	initial begin
		for (i = 0; i < 16; i = i+1 )
    begin
      bcd = i;
      #10;
    end
	end

endmodule
