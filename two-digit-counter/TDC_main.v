`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:50 05/03/2022 
// Design Name: 
// Module Name:    TDC_main 
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
module TDC_main(
    input clock,
    input reset,
    output [6:0] digit1,
    output [6:0] digit0
    );
	 
	reg clock_sec;
	
	freq_divider fd(
		.clr(reset), .clk(clock), .clkout(clock_sec)
	);
	
	wire [3:0] dig1;
	wire [3:0] dig0;
	wire clk;
	assign clk = clock_sec;
	
	counter_2digit cnt(
		.reset(reset), 
		.clock(clk), 
		.dig1(dig1),
		.dig0(dig0)
	);
	
	reg [6:0] seg1;
	reg [6:0] seg0;
	assign digit1 = seg1;
	assign digit0 = seg0;
	
	bcd_to_7 show1(
		.bcd(dig1), .seg(seg1)
	);
	bcd_to_7 show2(
		.bcd(dig0), .seg(seg0)
	);
	

endmodule
