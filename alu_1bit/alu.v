`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:51:11 04/19/2022
// Design Name:
// Module Name:    alu
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
module alu(
    input [1:0] Select,
    input Mode,
    input A,
    input B,
    output Output
    );

wire [1:0] sel;
assign sel = Select;

reg out;
assign Output = out;

always @(sel or A or B or Mode) begin
	if (!Mode) begin
		case (sel)
			2'b00: out = A;
			2'b01: out = ~A;
			2'b10: out = A^B;
			2'b11: out = ~(A^B);
		endcase
	end
	else begin
		case (sel)
			2'b00: out = A;
			2'b01: out = ~A;
			2'b10: out = A^B;
			2'b11: out = (~A)^B;
		endcase
	end
end

endmodule
