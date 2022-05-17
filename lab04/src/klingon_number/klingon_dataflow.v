`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:48:24 04/19/2022
// Design Name:
// Module Name:    klingon_dataflow
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
module klingon_dataflow(
    input [3:0] NUM,
    output [6:0] SEG
    );

	assign SEG = (NUM == 4'b0000) ? 7'b1111110 :
				 (NUM == 4'b0001) ? 7'b1000000 :
				 (NUM == 4'b0010) ? 7'b1000001 :
				 (NUM == 4'b0011) ? 7'b1001001 :
				 (NUM == 4'b0100) ? 7'b0100011 :
				 (NUM == 4'b0101) ? 7'b0011101 :
				 (NUM == 4'b0110) ? 7'b0100101 :
				 (NUM == 4'b0111) ? 7'b0010011 :
				 (NUM == 4'b1000) ? 7'b0110110 :
				 (NUM == 4'b1001) ? 7'b0110111 :
				 7'b0000000;

endmodule
