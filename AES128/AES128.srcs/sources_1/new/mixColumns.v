`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 06:20:49 PM
// Design Name: 
// Module Name: mixColumns
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


module mixColumns(  input [127:0] MC_Input, 
					output reg [127:0] MC_Output,
					input s3);
        always @(*)
        begin
             if(s3 ==1)
             begin	
             MC_Output[127:120] <= multiplytwo(MC_Input[127:120])  ^ multiplythree(MC_Input[95:88] ) ^ MC_Input[63:56]  ^ MC_Input[31:24] ;
             MC_Output[119:112] <= multiplytwo(MC_Input[119:112])  ^ multiplythree(MC_Input[87:80] ) ^ MC_Input[55:48]  ^ MC_Input[23:16] ;
             MC_Output[111:104] <= multiplytwo(MC_Input[111:104])  ^ multiplythree(MC_Input[79:72] ) ^ MC_Input[47:40]  ^ MC_Input[15:8] ;
             MC_Output[103:96] <=  multiplytwo(MC_Input[103:96])  ^ multiplythree( MC_Input[71:64] ) ^ MC_Input[39:32]  ^ MC_Input[7:0];
            
             MC_Output[95:88] <=  MC_Input[127:120]  ^ multiplytwo(MC_Input[95:88])  ^ multiplythree( MC_Input[63:56] ) ^ MC_Input [31:24];
             MC_Output[87:80] <=  MC_Input[119:112]  ^ multiplytwo(MC_Input[87:80] ) ^ multiplythree(MC_Input[55:48])  ^ MC_Input[23:16] ;
             MC_Output[79:72] <=  MC_Input[111:104]  ^ multiplytwo(MC_Input[79:72] ) ^ multiplythree(MC_Input[47:40])  ^ MC_Input[15:8] ;
             MC_Output[71:64] <=  MC_Input[103:96]   ^ multiplytwo( MC_Input[71:64] ) ^ multiplythree(MC_Input[39:32])  ^ MC_Input[7:0];
            
             MC_Output[63:56] <= (MC_Input[127:120])  ^ (MC_Input[95:88] ) ^ multiplytwo(MC_Input[63:56])  ^ multiplythree(MC_Input[31:24]);
             MC_Output[55:48] <=  (MC_Input[119:112])  ^ (MC_Input[87:80] ) ^ multiplytwo(MC_Input[55:48])  ^ multiplythree(MC_Input[23:16]);
             MC_Output[47:40] <= (MC_Input[111:104])  ^ (MC_Input[79:72] ) ^ multiplytwo(MC_Input[47:40])  ^ multiplythree(MC_Input[15:8]) ;
             MC_Output[39:32] <=  (MC_Input[103:96])  ^ ( MC_Input[71:64] ) ^ multiplytwo( MC_Input[39:32])  ^ multiplythree(MC_Input[7:0]);
            
             MC_Output[31:24] <=  multiplythree(MC_Input[127:120])  ^ (MC_Input[95:88] ) ^ MC_Input[63:56]  ^ multiplytwo(MC_Input[31:24]);
             MC_Output[23:16] <= multiplythree(MC_Input[119:112])  ^ (MC_Input[87:80] ) ^ MC_Input[55:48]  ^ multiplytwo(MC_Input[23:16]);
             MC_Output[15:8] <=  multiplythree(MC_Input[111:104])  ^ (MC_Input[79:72] ) ^ MC_Input[47:40]  ^ multiplytwo(MC_Input[15:8]) ;
             MC_Output[7:0] <= multiplythree(MC_Input[103:96])  ^ ( MC_Input[71:64] ) ^ MC_Input[39:32]  ^ multiplytwo(MC_Input[7:0]);	
             end
             else MC_Output <= MC_Input;
        end
            
    function automatic [7:0]multiplytwo(input [7:0]toMultiply);
    begin
       if(  toMultiply[7]== 1) multiplytwo = (toMultiply << 1) ^ (8'h1B);
       else multiplytwo = (toMultiply << 1);
    end
    endfunction
    
    function automatic [7:0]multiplythree(input [7:0]toMultiply);
    begin
       multiplythree = multiplytwo(toMultiply) ^ toMultiply;
    end
    endfunction
    
endmodule



    
    