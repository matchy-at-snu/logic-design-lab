`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   19:58:06 04/26/2022
// Design Name:   RS_flipflop
// Module Name:   /csehome/matchy/Documents/logic-design-lab/sequential_logic/test_flipflop.v
// Project Name:  sequential_logic
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: RS_flipflop
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_flipflop();
  
  // Inputs
  reg R;
  reg S;
  reg E;
  
  // Outputs
  wire Q;
  wire Q_L;
  wire Clk;
  
  Oscillator Os(
  .E(E),
  .F(Clk)
  );
  
  // Instantiate the Unit Under Test (UUT)
  RS_flipflop uut (
  .R(R),
  .S(S),
  .Clk(Clk),
  .Q(Q),
  .Q_L(Q_L)
  );
  
  initial begin
    // Initialize Inputs
    R = 0;
    S = 0;
    E = 0;
    #100;
    
    E = 1;
	 
    // SET
    R = 0; S = 1;
    #15;
    
	 // HOLD
    R = 0; S = 0;
    #5;
    
    // RESET
    R = 1; S = 0;
    #15;
    
	 // HOLD
	 R = 0; S = 0;
	 #30;
	 
	 // SET
    R = 0; S = 1;
    #5;
    
	 // HOLD
    R = 0; S = 0;
    #30;
	 
	 R = 1; S = 1;
	 #10;
    
  end
  
endmodule
  
