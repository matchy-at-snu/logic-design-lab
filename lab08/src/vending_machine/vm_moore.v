`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:15:23 05/17/2022
// Design Name:
// Module Name:    vm_moore
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
module vm_moore(
    input N,
    input D,
    input RESET,
    input CLK,
    output [3:0] BCD1, // for the ease of BCD conversion
    output [3:0] BCD0,
    output O
    );

  // One-hot encoding of internal states
  parameter [3:0] NO_MONEY  = 4'b0001, // 0$
                  A_NICKEL  = 4'b0010, // 5$
                  A_DIME    = 4'b0100, // 10$
                  FIFTEEN   = 4'b1000; // 15$
  reg [3:0] state;

  always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
      state = NO_MONEY;
    end else begin
      case (state)
        NO_MONEY: begin
          if (RESET) begin
            state = NO_MONEY;
          end else if (N) begin
            state = A_NICKEL;
          end else if (D) begin
            state = A_DIME;
          end else begin
            state = NO_MONEY;
          end
        end
        A_NICKEL: begin
          if (RESET) begin
            state = NO_MONEY;
          end else if (N) begin
            state = A_DIME;
          end else if (D) begin
            state = FIFTEEN;
          end else begin
            state = A_NICKEL;
          end
        end
        A_DIME: begin
          if (RESET) begin
            state = NO_MONEY;
          end else if (N || D) begin
            state = FIFTEEN;
          end else begin
            state = A_DIME;
          end
        end
        FIFTEEN: begin
          if (RESET) begin
            state = NO_MONEY;
          end else begin
            state = FIFTEEN;
          end
        end
      endcase
    end
  end

  assign O = (state == FIFTEEN)? 1 : 0;
  assign BCD0 = (state == NO_MONEY) ? 4'b0000 :
                (state == A_NICKEL) ? 4'b0101 :
                (state == A_DIME)   ? 4'b0000 :
                4'b0101;
  assign BCD1 = (state == NO_MONEY) ? 4'b0000 :
                (state == A_NICKEL) ? 4'b0000 :
                (state == A_DIME)   ? 4'b0001 :
                4'b0001;

endmodule
