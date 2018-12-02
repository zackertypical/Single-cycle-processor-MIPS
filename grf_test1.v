`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:58:12 11/17/2018
// Design Name:   GRF
// Module Name:   C:/hdl/p4/grf_test1.v
// Project Name:  p4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GRF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module grf_test1;

	// Inputs
	reg [4:0] RA;
	reg [4:0] RB;
	reg [4:0] RW;
	reg [31:0] WD;
	reg Clk;
	reg Reset;
	reg WE;
	reg WPC;

	// Outputs
	wire [31:0] busA;
	wire [31:0] busB;

	// Instantiate the Unit Under Test (UUT)
	GRF uut (
		.RA(RA), 
		.RB(RB), 
		.RW(RW), 
		.WD(WD), 
		.Clk(Clk), 
		.Reset(Reset), 
		.WE(WE), 
		.WPC(WPC), 
		.busA(busA), 
		.busB(busB)
	);

	initial begin
		// Initialize Inputs
		RA = 0;
		RB = 0;
		RW = 0;
		WD = 0;
		Clk = 0;
		Reset = 0;
		WE = 0;
		WPC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

