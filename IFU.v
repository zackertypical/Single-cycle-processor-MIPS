`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:21 11/17/2018 
// Design Name: 
// Module Name:    IFU 
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
`include "head.v"
module IFU(
	input signed [31:0] PC_branch,
	input [31:0] PC_jump,
	input [31:0] PC_jr,
	input Reset,
	input Clk,
	input Zero,
	input [1:0]nPC_sel,
	output reg [31:0] pc,
	output [31:0] pc4
    );
	 wire [31:0]beqb = (PC_branch<<<2)+4+pc;
	 initial begin
		pc<= 32'h00003000;
	 end
	 
	 always@(posedge Clk)
	 begin
		if(Reset)
			begin
				pc <= 32'h00003000;
			end
		else
			begin
				case(nPC_sel)
					`IFU_add4: pc <= pc+4;
					//`IFU_beq: pc <= Zero?(PC_branch<<<2)+4+pc:pc+4;
					`IFU_beq: pc <= Zero?{18'h0,2'b11,beqb[11:2],2'b00}:pc+4;
					//`IFU_j: pc<={pc[31:28],PC_jump[25:0],2'b0};
					`IFU_j: pc<={18'h0,2'b11,PC_jump[9:0],2'b0};
					//`IFU_jr: pc<=PC_jr;
					`IFU_jr: pc<={18'h0,2'b11,PC_jr[11:2],2'b00};
				endcase
			
			end
	 
	 end
	 assign pc4 = pc+4;
	


endmodule
