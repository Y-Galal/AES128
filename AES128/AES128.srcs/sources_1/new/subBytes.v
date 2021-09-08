`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:45 08/22/2021 
// Design Name: 
// Module Name:    subBytes 
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
module subBytes(  input [127:0] SB_Input, 
						output [127:0] SB_Output,
						input s1);

		reg [127:0]SBout;
		reg [7:0]SBox[0:255];
		initial
		begin
	       	$readmemh("Sbox.data",SBox,0,255);
		end
		
		always @(* )
		begin
		      if(s1==1)
		      begin
                SBout[127:120] <= SBox[SB_Input[127:120]];
                SBout[119:112] <= SBox[SB_Input[119:112]];
                SBout[111:104] <= SBox[SB_Input[111:104]];
                SBout[103:96] <= SBox[SB_Input[103:96]];
                SBout[95:88] <= SBox[SB_Input[95:88]];
                SBout[87:80] <= SBox[SB_Input[87:80]];
                SBout[79:72] <= SBox[SB_Input[79:72]];
                SBout[71:64] <= SBox[SB_Input[71:64]];
                SBout[63:56] <= SBox[SB_Input[63:56]];
                SBout[55:48] <= SBox[SB_Input[55:48]];
                SBout[47:40] <= SBox[SB_Input[47:40]];
                SBout[39:32] <= SBox[SB_Input[39:32]];
                SBout[31:24] <= SBox[SB_Input[31:24]]; 
                SBout[23:16] <= SBox[SB_Input[23:16]];
                SBout[15:8] <= SBox[SB_Input[15:8]];
                SBout[7:0] <= SBox[SB_Input[7:0]];
               end
              else
                SBout <= SB_Input;
		end

		assign SB_Output = SBout;
endmodule
