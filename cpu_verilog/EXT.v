`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:31 11/17/2018 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
	input [15:0] imm16,
	input ExtOp,
	output [31:0] imm32
    );
	 assign imm32 = ExtOp?{{16{imm16[15]}},imm16}:{{16{1'b0}},imm16};
	//extop为1的时候符号拓展
	//为0的时候0拓展

endmodule
