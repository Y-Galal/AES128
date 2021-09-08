`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 12:06:14 AM
// Design Name: 
// Module Name: addroundkey
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


module addroundkey( input clock,input[127:0] roundKey, output [127:0]newKey, input s4 );

   
    reg [7:0]rcon[0:9];
    reg [7:0]SBox[0:255];
    reg [127:0] keyout;
   initial
    begin
        $readmemh("rcon.data",rcon,0,9);
        $readmemh("Sbox.data",SBox,0,255);

    end

    reg [3:0] i= 0;
    always @(posedge clock)
    begin   
        if(s4==0)
            keyout <= roundKey;
        else
        begin
            if(i==9) i<=0;
            else i<= i+1;
            keyout<= rotateAndSub(roundKey, i);

        end
    end
    assign newKey = keyout;
    
function [127:0] rotateAndSub(input [127:0] keyIn, input [3:0]i);
    begin
    
    rotateAndSub[127:120] = (keyIn[127:120] ^  rcon[i] ) ^ SBox[keyIn[71:64]] ;  //First row
    rotateAndSub[95:88] = keyIn[95:88]^ SBox[keyIn[39:32]]  ;   
    rotateAndSub[63:56] = keyIn[63:56]^ SBox[keyIn[7:0]] ;
    rotateAndSub[31:24] = keyIn[31:24]^ SBox[keyIn[103:96]];
    
    rotateAndSub[119:112] = keyIn[119:112]  ^ rotateAndSub[127:120] ; //Second row
    rotateAndSub[87:80] =  keyIn[87:80]  ^ rotateAndSub[95:88] ;
    rotateAndSub[55:48] =  keyIn[55:48]  ^ rotateAndSub[63:56];    
    rotateAndSub[23:16]= keyIn[23:16]  ^ rotateAndSub[31:24];
               
    rotateAndSub[111:104] = keyIn[111:104]  ^ rotateAndSub[119:112] ; //Third row
    rotateAndSub[79:72] =  keyIn[79:72]  ^ rotateAndSub[87:80] ;
    rotateAndSub[47:40] = keyIn[47:40]   ^  rotateAndSub[55:48] ;
    rotateAndSub[15:8] =  keyIn[15:8]  ^ rotateAndSub[23:16] ;
    
    rotateAndSub[103:96] = keyIn[103:96]   ^ rotateAndSub[111:104]; //Fourth row    
    rotateAndSub[71:64] =  keyIn[71:64]   ^ rotateAndSub[79:72];    
    rotateAndSub[39:32] =  keyIn[39:32]   ^ rotateAndSub[47:40];
    rotateAndSub[7:0] =   keyIn[7:0]   ^  rotateAndSub[15:8];

    end    
endfunction

endmodule














