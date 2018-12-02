`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:19 11/28/2018 
// Design Name: 
// Module Name:    msba 
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
module msba();
	reg signed [31:0]rs = 32'hffffffff;
	reg signed [31:0]rt = 32'b1010100111;

	//reg signed [63:0]temp;
	wire [5:0] a = {1'b0,rt[4:0]};
	wire [5:0] b = {1'b0,rt[9:5]};
	wire [63:0]t = ({rs,rs}>>a)<<(32-b);
	wire signed [31:0]rd = $signed(t[31:0])>>>(32-b);
	
	
	initial begin
//		temp[31:0] = rs;
//		temp[63:32] = rs;
//		#5
//		temp = temp >> a;
//		#5
//		temp = temp << (32-b);
//		#5
//		rd = temp[31:0];
//		#5
//		rd = rd >>> (32-b);
	end
	

endmodule
