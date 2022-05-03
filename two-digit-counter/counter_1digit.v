`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:55:01 05/03/2022
// Design Name:
// Module Name:    Counter
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
module counter_1digit(
    input R,
    input Clk,
    output [3:0] O
    );

	reg [3:0] Output;
	assign O = Output;

	always @(posedge Clk) begin
		if (!R) begin
			  if (Output == 9) begin
					Output <= 0;
			  end
			  else begin
				 Output <= Output + 1;
			  end
		end
		else begin
			Output <= 0;
		end
	end

endmodule
