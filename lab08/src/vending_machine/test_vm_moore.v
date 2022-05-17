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

  always #10 CLK = ~CLK;

  reg [3:0] i;

  initial begin
    // Initialize Inputs
    N = 0;
    D = 0;
    RESET = 1;
    CLK = 0;

    // Wait 100 ns for global reset to finish
    #125;

    for (i = 0; i < 4'b1100; i = i+1) begin
      RESET = 1;
      #20;
      RESET = 0;
      N = i[2];
      D = i[3];
      #20;
      N = i[0];
      D = i[1];
      #20;
    end

  RESET = 1;
  #20;
  end

endmodule
