`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 11:20:37 PM
// Design Name: 
// Module Name: mixColumnstb
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


module mixColumnstb;

reg clk;

reg [127:0] MCInput;
wire [127:0] MCOutput;


mixColumns MC1(  .MC_Input(MCInput), .MC_Output(MCOutput),.clock(clk)  );

initial
begin
clk=0;
MCInput =0;
#100;
//adding simulation

		MCInput= 128'hD4E0B81EBFB441275D52119830AEF1E5;

	end
      always #10 clk=~clk;


endmodule
