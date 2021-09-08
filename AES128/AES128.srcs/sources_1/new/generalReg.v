`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 12:13:59 AM
// Design Name: 
// Module Name: generalReg
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


module GeneralReg
# (parameter len = 128)
(input [len-1:0] Data, input clk, output reg [len-1:0] Q, input enable);

always@(posedge clk)
begin
   if(enable ==1)
        Q <= Data;
end
endmodule
