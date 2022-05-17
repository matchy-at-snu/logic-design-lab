`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   18:58:34 04/26/2022
// Design Name:   RSlatch
// Module Name:   /csehome/matchy/Documents/logic-design-lab/sequential_logic/test_RSlatch.v
// Project Name:  sequential_logic
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: RSlatch
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_RSlatch();

  // Inputs
  reg R;
  reg S;

  // Bidirs
  wire Q;
  wire Q_L;

  // Instantiate the Unit Under Test (UUT)
  RSlatch uut (
  .R(R),
  .S(S),
  .Q(Q),
  .Q_L(Q_L)
  );

  initial begin

    // RESET
    R = 1; S = 0;
    #100;

    // HOLD
    R = 0; S = 0;
    #50;

    // SET
    R = 0; S = 1;
    #50;

    // INVALID
    R = 1; S = 1;
    #50;

	 // RESET
	 R = 1; S = 0;
	 #50;

    // HOLD
    R = 0; S = 0;
    #50;

	 // SET
	 R = 0; S = 1;
	 #100;

	 // INVALID
	 R = 1; S = 1;
	 #100;

	 // HOLD
	 R = 0; S = 0;
	 #200;
	 // Expecting race

	 // RESET AND HOLD
	 R = 1; S = 0;
	 #100;
	 R = 0; S = 0;
	 #100;

  end

endmodule
