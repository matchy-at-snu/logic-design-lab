`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   18:55:01 05/17/2022
// Design Name:   vm_main
// Module Name:   /csehome/matchy/Documents/logic-design-lab/lab08/src/vending_machine/test_vm_main.v
// Project Name:  vending_machine
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: vm_main
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_vm_main;

  // Inputs
  reg N;
  reg D;
  reg RESET;
  reg CLK;

  // Outputs
  wire [6:0] D1;
  wire [6:0] D0;
  wire rel;

  // Instantiate the Unit Under Test (UUT)
  vm_main uut (
    .N(N),
    .D(D),
    .RESET(RESET),
    .CLK(CLK),
    .D1(D1),
    .D0(D0),
    .rel(rel)
  );

  reg [3:0] i;

  always #10 CLK = ~CLK;

  initial begin
    // Initialize Inputs
    N = 0;
    D = 0;
    RESET = 1;
    CLK = 0;

    // Wait 100 ns for global reset to finish
    #225;

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
