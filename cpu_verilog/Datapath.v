`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:10 11/17/2018 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(
	input clk,reset
    );
	 //�����ź�����
	 //��Ҫ���ź�
	wire [1:0]RegDst,RegSrc,nPC_sel;
	wire [3:0] ALUCtr;
	wire RegWrite,ALUSrc,MemWrite,ExtOp,MemByte,MemHByte;
	wire [31:0]instr;
	 
	 //�����ź�
	 wire [31:0]busA,busB,pc,pc4,aluresult,extout,ALUb,dmout,regdata;
	 wire [4:0]rs = instr[25:21],rt = instr[20:16],rd = instr[15:11],rr = instr[10:6];
	 wire [4:0]regaddr;
	 wire [15:0]imm = instr[15:0];
	 wire [31:0]pc_j = {{6{1'b0}},instr[25:0]};
	 
	 wire zero;
	 
	 //��Ҫ���ź�
	Controller ctr(
	.OpCode(instr[31:26]),
	.func(instr[5:0]),
	.RegDst(RegDst),
	.RegSrc(RegSrc),
	.ALUCtr(ALUCtr),
	.RegWrite(RegWrite),
	.ALUSrc(ALUSrc),
	.MemWrite(MemWrite),
	.nPC_sel(nPC_sel),
	.ExtOp(ExtOp),
	.MemByte(MemByte),
	.MemHByte(MemHByte)
    );
	 
	ALU alu(
		.A(busA),
		.B(ALUb),
		.ALUCtr(ALUCtr),
		.Zero(zero),
		.Result(aluresult)
    );
	
	EXT ext(
		.imm16(imm),
		.ExtOp(ExtOp),
		.imm32(extout)
    );
	 
	 mux2 #(32) AluMux(ALUSrc,busB,extout,ALUb);
	 DM dm(
		.DataIn(busB),
		.MemAddr(aluresult),
		.pc(pc),
		.WrEn(MemWrite),
		.Byte(MemByte),
		.HByte(MemHByte),
		.Reset(reset),
		.Clk(clk),
		.DataOut(dmout)
    );
	 
	 mux3 #(32) RegSrcMux(RegSrc,aluresult,dmout,pc4,regdata);
	 
	 IM im(
		.pc(pc),
		.Instr(instr)
    );
	 
	 IFU ifu(
		.PC_branch(extout),
		.PC_jump(pc_j),
		.PC_jr(busA),
		.Reset(reset),
		.Clk(clk),
		.Zero(zero),
		.nPC_sel(nPC_sel),
		.pc(pc),
		.pc4(pc4)
    );
	 
	 mux3 #(5)RegDstMux(RegDst,rd,rt,5'h1f,regaddr);
	GRF grf(
	.RA(rs),
	.RB(rt),
	.RW(regaddr),////
	.WD(regdata),
	.Clk(clk),
	.Reset(reset),
	.WE(RegWrite),
	.WPC(pc),
	.busA(busA),
	.busB(busB)
    );

endmodule
