`timescale 1ns / 1ps
module RB1 (Q, CLK, WENn, A, D);
    parameter WORD_WIDTH = 8;
    parameter WORD_DEPTH = 18;
    parameter ADDR_WIDTH = 5;
    
    input CLK, WENn;
    input [ADDR_WIDTH-1:0] A;
    input [WORD_WIDTH-1:0] D;
    output [WORD_WIDTH-1:0] Q;
    
    reg [WORD_WIDTH-1:0] CELL [WORD_DEPTH-1:0];
    reg [WORD_WIDTH-1:0] Q;
    
    always@(posedge CLK)
    if (WENn)
	   Q <= CELL[A];
    else
	   CELL[A] <= D;
    
endmodule
