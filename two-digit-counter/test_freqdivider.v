`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   13:59:11 05/10/2022
// Design Name:   freq_divider
// Module Name:   /csehome/matchy/Documents/logic-design-lab/two-digit-counter/test_freqdivider.v
// Project Name:  two-digit-counter
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: freq_divider
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_freqdivider;

  // Inputs
  reg clr;
  reg clk;

  // Outputs
  wire clkout;

  // Instantiate the Unit Under Test (UUT)
  freq_divider uut (
    .clr(clr),
    .clk(clk),
    .clkout(clkout)
  );
  
  always #10 clk=~clk;

  initial begin
    // Initialize Inputs
    clr = 1;
    clk = 0;

    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here
    clr = 0;

  end

endmodule
