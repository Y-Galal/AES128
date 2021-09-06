`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2021 06:18:33 PM
// Design Name: 
// Module Name: subBytestb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module subBytestb;

reg clk;

reg [127:0] SBInput;
wire [127:0] SBOutput;
reg startSig;

subBytes SB1(  .SB_Input(SBInput), .SB_Output(SBOutput), .SB_Start(startSig),.clock(clk));

initial
begin
clk=0;
SBInput =0;
startSig =0;
#100;
//adding simulation

		startSig=1;
		SBInput= 128'h19A09AE93DF4C6F8E3E28D48BE2B2A08;

	end
      always #10 clk=~clk;


endmodule
