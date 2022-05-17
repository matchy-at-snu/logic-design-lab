`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   17:32:19 05/17/2022
// Design Name:   vm_moore
// Module Name:   /csehome/matchy/Documents/logic-design-lab/lab08/src/vending_machine/test_vm_moore.v
// Project Name:  vending_machine
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: vm_moore
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_vm_moore();

  // Inputs
  reg N;
  reg D;
  reg RESET;
  reg CLK;

  // Outputs
  wire O;

  // Instantiate the Unit Under Test (UUT)
  vm_moore uut (
    .N(N),
    .D(D),
    .RESET(RESET),
    .CLK(CLK),
    .O(O)
  );

  initial begin
    // Initialize Inputs
    N = 0;
    D = 0;
    RESET = 0;
    CLK = 0;

    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here

  end

endmodule
