`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 09:22:49 PM
// Design Name: 
// Module Name: addroundkeytb
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


module addroundkeytb;

reg clock;
reg [127:0]roundKey;

reg s4;
wire [127:0]newKey;

addroundkey  testunit ( clock,  roundKey, newKey, s4 );

always #10 clock=~clock;

initial
begin

    clock=0;
    roundKey=0;
    s4=0;
    
    #105;
    
    //sim
    roundKey =128'h2B28AB097EAEF7CF15D2154F16A6883C;
    s4=1;
    #10;
    s4=0;

end


endmodule
