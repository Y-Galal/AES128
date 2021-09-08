`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 04:41:03 PM
// Design Name: 
// Module Name: Toptb
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


module Toptb;

reg clock;
reg [127:0] dataIn;
reg [127:0] keyIn;
wire [127:0] encrypted;
reg startSig;
Top  UUT( dataIn, keyIn , startSig, clock, encrypted );

initial
begin
clock =0;
dataIn=0;
startSig=0;
keyIn=0;
#100;
    // adding simulation
    
    dataIn = 128'h328831E0435A3137F6309807A88DA234;
    keyIn=128'h2B28AB097EAEF7CF15D2154F16A6883C;
    startSig=1;
    
    #20 startSig=0;     //expected output 128'h3902dc1925dc116a8409850b1dfb9732
    #300;
    
    dataIn = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    keyIn=128'h2B28AB097EAEF7CF15D2154F16A6883C;
    startSig=1;
    
    #20 startSig=0;
    
end

always #10 clock=~clock;

endmodule
