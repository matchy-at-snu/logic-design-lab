`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    06:46:37 04/12/2022
// Design Name:
// Module Name:    mux_4_to_1_dataflow
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
module mux_4_to_1_dataflow(
    input [3:0] I,
    input A,
    input B,
    output Y
    );

	wire [1:0] sel;
	reg out;

	assign sel = {B, A};
	assign Y =(sel == 2'b00 && I) ? I[0] :
				 (sel == 2'b01 && I) ? I[1] :
				 (sel == 2'b10 && I) ? I[2] :
				 (sel == 2'b11 && I) ? I[3] :
				 0;


endmodule
