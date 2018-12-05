`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:55:53 11/16/2018 
// Design Name: 
// Module Name:    head 
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

//ALU
`define ALU_addu    4'b0000
`define ALU_subu    4'b0001
`define ALU_and     4'b0010
`define ALU_or      4'b0011
`define ALU_sll16   4'b0100
`define ALU_srav    4'b0101
`define ALU_srl     4'b0110
`define ALU_bgez    4'b0111
`define ALU_xori    4'b1000


//IFU
`define IFU_add4 	2'b00
`define IFU_beq 	2'b01
`define IFU_j 		2'b10
`define IFU_jr 	2'b11

`define RD_15_11  2'b00
`define RD_20_16  2'b01
`define RD_31 	  	2'b10

`define RegS_ALU  2'b00
`define RegS_DM   2'b01
`define RegS_PC4  2'b10


//OpCode
`define R_addu (OpCode == 6'b000000 && func == 6'b100001)
`define R_subu (OpCode == 6'b000000 && func == 6'b100011)
`define R_jr   (OpCode == 6'b000000 && func == 6'b001000)
`define R_srav (OpCode == 6'b000000 && func == 6'b000111)
`define R_srl  (OpCode == 6'b000000 && func == 6'b000010)

`define ori 	(OpCode == 6'b001101)
`define lw 		(OpCode == 6'b100011)
`define sw 		(OpCode == 6'b101011)
`define beq 	(OpCode == 6'b000100)
`define lui 	(OpCode == 6'b001111)
`define j 		(OpCode == 6'b000010)
`define jal 	(OpCode == 6'b000011)
`define nop 	(OpCode == 6'b000000 && func == 6'b000000)
`define sb 		(OpCode == 6'b101000)
`define lb 		(OpCode == 6'b100000)
`define sh 		(OpCode == 6'b101001)
`define lh 		(OpCode == 6'b100001)
`define bgez   (OpCode == 6'b000001)
`define xori   (OpCode == 6'b001110)
