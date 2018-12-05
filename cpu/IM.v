`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:40 11/16/2018 
// Design Name: 
// Module Name:    IM 
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
module IM(
	input [31:0]pc,
	output [31:0]Instr
    );
	 
	 wire [31:0]ad;
	 reg [31:0] instrctions[1023:0];
	 initial begin
		$readmemh("code.txt",instrctions);
	 end
	 
	 assign ad = (pc-32'h00003000)/4;
	 assign Instr = instrctions[ad];
endmodule
