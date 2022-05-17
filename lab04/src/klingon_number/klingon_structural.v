`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:47:53 04/19/2022
// Design Name:
// Module Name:    klingon_structural
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module klingon_structural(
    input [3:0] NUM,
    output [6:0] SEG
    );

	wire IN0 = NUM[0];
	wire IN1 = NUM[1];
	wire IN2 = NUM[2];
	wire IN3 = NUM[3];

	wire N_IN0 = ~IN0;
	wire N_IN1 = ~IN1;
	wire N_IN2 = ~IN2;
	wire N_IN3 = ~IN3;

	wire a, b, c, d, e, f, g;
	assign SEG = {a, b, c, d, e, f, g};

	assign a = N_IN2 & N_IN3;
	assign b = IN3 | (IN2 & N_IN0) | (N_IN1 & N_IN0);
	assign c = IN3 | (N_IN2 & N_IN1 & N_IN0) | (IN2 & IN0);
	assign d = (N_IN3 & N_IN2 & N_IN1 & N_IN0) | (IN2 & N_IN1 & IN0) | (N_IN2 & IN1 & IN0);
	assign e = (N_IN2 & N_IN1 & N_IN0) | IN3 | (IN2 & N_IN1 & IN0) | (IN2 & IN1 & N_IN0);
	assign f = IN3 | (N_IN1 & N_IN0) | (IN2 & IN1 & IN0);
	assign g = IN2 | IN1 | (IN3 & IN0);

endmodule
