`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 05:50:00 PM
// Design Name: 
// Module Name: shiftRows
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
module shiftRows(  input [127:0] SR_Input, 
				   output [127:0] SR_Output);
				   
	assign SR_Output[127:96] = SR_Input[127:96];
	assign SR_Output[95:72] = SR_Input[87:64];
	assign SR_Output[71:64] = SR_Input[95:88];
	assign SR_Output[63:48] = SR_Input[47:32];
	assign SR_Output[47:32] = SR_Input[63:48];
	assign SR_Output[31:24] = SR_Input[7:0];	
    assign SR_Output[23:0] = SR_Input[31:8];

endmodule
