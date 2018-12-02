`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:18 11/29/2018
// Design Name:   forxun
// Module Name:   C:/hdl/p4/fort.v
// Project Name:  p4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: forxun
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fort;

	// Inputs
	reg [31:0] a;

	// Outputs
	wire b;

	// Instantiate the Unit Under Test (UUT)
	forxun uut (
		.a(a), 
		.b(b)
	);

	initial begin
	#100;
		// Initialize Inputs
		a = 32'd31;

		// Wait 100 ns for global reset to finish
		#100;
        
		  a = 32'd288;
		  
		  #100;
		   a = 32'd2;
		// Add stimulus here

	end
      
endmodule

