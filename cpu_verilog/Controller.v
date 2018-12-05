`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:25 11/17/2018 
// Design Name: 
// Module Name:    Controller 
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
module Controller(
	input [5:0] OpCode,
	input [5:0] func,
	output [1:0]RegDst,
	output [1:0]RegSrc,
	output [3:0] ALUCtr,
	output RegWrite,
	output ALUSrc,
	output MemWrite,
	output [1:0]nPC_sel,
	output ExtOp,
	output MemByte,
	output MemHByte
    );
	 //wire ALU0,ALU1,ALU2,ALU3,RegDst0,RegDst1,RegSrc0,RegSrc1,PC0,PC1;
	 
	 //��Ҫ�Ĳ�����
	 assign ExtOp = `lw|`sw|`beq|`lb|`sb|`lh|`sh|`bgez;
	 assign RegWrite = `R_addu|`R_subu|`ori|`lw|`lui|`jal|`lb|`lh|`R_srav|`xori;
	 assign ALUSrc = `ori||`lw||`sw||`lui||`lb||`sb||`lh||`sh||`xori;
	 assign MemWrite = `sw||`sb||`sh;


	 assign MemByte = `sb|`lb;
	 assign MemHByte = `sh|`lh;
	 
	 assign RegSrc = (`lw |`lb|`lh)?`RegS_DM:
						  (`jal)?`RegS_PC4:
						  `RegS_ALU;

	 assign RegDst = (`R_addu | `R_subu |`R_srav)?`RD_15_11:
						  (`jal)?`RD_31:
						  `RD_20_16;
	 
	 assign ALUCtr = 	(`R_subu|`beq)?`ALU_subu:
							(`ori)?`ALU_or:
							(`lui)?`ALU_sll16:
							(`R_srav)?`ALU_srav:
							(`bgez)?`ALU_bgez:
							(`xori)?`ALU_xori:
							`ALU_addu;

	 assign nPC_sel = 	(`beq|`bgez)?`IFU_beq:
								(`j|`jal)?`IFU_j:
								(`R_jr)?`IFU_jr:
								`IFU_add4;



endmodule
