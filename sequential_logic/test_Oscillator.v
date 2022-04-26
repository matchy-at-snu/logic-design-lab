`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   19:15:06 04/26/2022
// Design Name:   Oscillator
// Module Name:   /csehome/matchy/Documents/logic-design-lab/sequential_logic/test_Oscillator.v
// Project Name:  sequential_logic
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: Oscillator
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_Oscillator();
  reg E;
  
  wire F;
  
  Oscillator uut (
  .E(E),
  .F(F)
  );
  
  initial begin
    // Initialize Inputs
    E = 0;
    
    // Wait 100 ns for global reset to finish
    #100;
    
    // Add stimulus here
    
    E = 1;
    #900;
    
  end
  
endmodule
  
