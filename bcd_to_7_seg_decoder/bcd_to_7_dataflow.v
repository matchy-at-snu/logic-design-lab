`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:03:32 04/12/2022
// Design Name:
// Module Name:    bcd_to_7_dataflow
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
module bcd_to_7_dataflow(
    input [3:0] NUM,
    output [6:0] SEG
    );

    assign SEG = (NUM == 4'b0000) ? 7'b1111110 : // 0
				 (NUM == 4'b0001) ? 7'b0110000 :
				 (NUM == 4'b0010) ? 7'b1101101 :
				 (NUM == 4'b0011) ? 7'b1111001 :
				 (NUM == 4'b0100) ? 7'b0110011 :
				 (NUM == 4'b0101) ? 7'b1011011 :
				 (NUM == 4'b0110) ? 7'b1011111 :
				 (NUM == 4'b0111) ? 7'b1110010 :
				 (NUM == 4'b1000) ? 7'b1111111 :
				 (NUM == 4'b1001) ? 7'b1111011 :
				 7'b0000000;

endmodule
