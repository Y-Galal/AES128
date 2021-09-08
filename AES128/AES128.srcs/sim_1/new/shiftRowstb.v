`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 06:08:19 PM
// Design Name: 
// Module Name: shiftRowstb
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


module shiftRowstb;

reg clk;

reg [127:0] SRInput;
wire [127:0] SROutput;


shiftRows SR1(  .SR_Input(SRInput), .SR_Output(SROutput), .clock(clk));

initial
begin
clk=0;
SRInput =0;
#100;
//adding simulation

		SRInput= 128'hd4e0b81e27bfb44111985d52aef1e530;

	end
      always #10 clk=~clk;


endmodule
