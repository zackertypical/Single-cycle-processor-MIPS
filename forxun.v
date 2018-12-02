`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:16 11/29/2018 
// Design Name: 
// Module Name:    forxun 
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
module forxun(
	input [31:0] a,
	output reg b
    );
	 
	 integer i,cnt;
	 
	 initial begin
		b = 0;
		cnt = 0;
	 end
	 
	 always @(*)
	 begin
		cnt = 0;
		for(i = 0;i <31;i=i+1)
		begin
			if(a[i]==1)
				cnt = cnt +1;
			else
				cnt = cnt;
		end
		if(cnt == 1)
			b = 1;
		else 
			b = 0;

		
	 end
	 


endmodule
