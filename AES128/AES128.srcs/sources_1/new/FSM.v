`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 01:51:18 PM
// Design Name: 
// Module Name: FSM
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


module FSM( input startSignal, input clock, output reg s1, output reg s2,output reg s3,output reg opEnable, output reg inPass, output reg s4,output reg reg_EN);

reg [2:0]currentState;
parameter Idle = 3'b00;
parameter initialRound = 3'b01;
parameter mainRounds = 3'b10;
parameter finalRound = 3'b11;
parameter outputHere= 3'b100;
integer i;
initial
begin 
    currentState = Idle;
    i=0;
    s4=0;
    s1=0;
    s2=0;
    s3=0;
    reg_EN=0;
    opEnable=0;
    inPass=0;
end
always @(posedge clock)
begin
    case(currentState)
    Idle: 
    begin
        inPass<=0;
        s1 <=0;
        s2 <=0;
        s3 <=0;
        s4<=0;
        reg_EN<=0;
        opEnable<=0;
        if(startSignal==1)
        begin
            currentState <= initialRound;
        end
    end
    initialRound:
    begin
        inPass<=1;
        s1 <=0;
        s2 <=0;
        s3 <=0;
        s4<=0;
        reg_EN<=1;
        opEnable<=0;
        currentState<=mainRounds;
    end
    mainRounds:
    begin
        inPass<=0;
        s1<=1;
        s2<=1;
        s3<=1;
        s4<=1;
        reg_EN<=1;
        opEnable<=0;
        if(i == 8)
        begin
            i<=0;
            currentState <=finalRound;
        end
        else
        begin 
            i<=i+1;
        end
    end
    finalRound:
    begin 
        inPass<=0;
        s1<=1;
        s2<=1;
        s3<=0;
        s4<=1;
        reg_EN<=1;
        opEnable<=0;
        currentState<=outputHere;
    end
    outputHere:
    begin
        opEnable<=1;
        inPass<=0;
        s1 <=0;
        s2 <=0;
        s3 <=0;
        s4<=0;
        reg_EN<=1;
        currentState <=Idle;
    end
    endcase
end
endmodule
