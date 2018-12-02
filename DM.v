`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:06 11/16/2018 
// Design Name: 
// Module Name:    DM 
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
module DM(
	input [31:0]DataIn,
	input [31:0]MemAddr,
	input [31:0]pc,
	input WrEn,
	input Byte,
	input HByte,
	input Reset,
	input Clk,
	output [31:0]DataOut
    );
	 //wire [31:0]_MemAddr = {20'h0,MemAddr[11:2],2'b00};
	 wire [31:0]_MemAddr = MemAddr;
	 reg [7:0]MemData[8191:0];
	 integer i;
	// wire [31:2]ad = MemAddr[31:2];
	 ///////////####
	 initial begin
	 	for(i = 0;i <8192;i = i+1)
			MemData[i] <= 0;
	 end
	 
	 always @(posedge Clk)
	 begin
		if(Reset)
		begin
			for(i = 0;i <8192;i = i+1)
				MemData[i] <= 0;
		end
		else
			if(WrEn)
				if(Byte)
					begin 
						MemData[_MemAddr] <= DataIn[7:0];
						$display("@%h: *%h <= %h",pc,_MemAddr,DataIn);
					end 
				else if (HByte)
					begin 
						{MemData[_MemAddr+1],MemData[_MemAddr]} <= DataIn[15:0];
						$display("@%h: *%h <= %h",pc,_MemAddr,DataIn);
					end
				else
					begin
						{MemData[_MemAddr+3],MemData[_MemAddr+2],MemData[_MemAddr+1],MemData[_MemAddr]}<= DataIn;
						$display("@%h: *%h <= %h",pc,_MemAddr,DataIn);
					
					end
	 end
	 assign DataOut = Byte?{{28{MemData[_MemAddr][7]}},MemData[_MemAddr]}:
							HByte?{{16{MemData[_MemAddr+1][7]}},MemData[_MemAddr+1],MemData[_MemAddr]}:
							{MemData[_MemAddr+3],MemData[_MemAddr+2],MemData[_MemAddr+1],MemData[_MemAddr]};


endmodule
