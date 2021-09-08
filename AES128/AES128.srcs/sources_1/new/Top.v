`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Youssef Galal
// 
// Create Date: 09/05/2021 05:14:40 PM
// Design Name: 
// Module Name: Top
// Project Name: AES Encryption core
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


module Top( input [127:0] dataToEncrypt, input [127:0]cypherKey , input startSignal,input clock, output reg [127:0]encryptedOut );


// FSM Instantiation
wire outEN,s1,s2,s3,s4,in_Pass,reg1_EN;     // FSM Signals
FSM  U1( .startSignal(startSignal), .clock(clock), .s1(s1), .s2(s2), .s3(s3), .opEnable(outEN), .inPass(in_Pass), .s4(s4),.reg_EN(reg1_EN));
////////////////////////////////////////////////////////////////////////////////////
// SubBytes, ShiftRows, Mix Columns instantiation
reg [127:0]SBInput;
wire [127:0]SBOut;
wire [127:0]SROut;
wire [127:0]MCOut;
subBytes U2(  .SB_Input(SBInput), .SB_Output(SBOut), .s1(s1));	
shiftRows U3(  .SR_Input(SBOut), .SR_Output(SROut), .s2(s2));
mixColumns U4(  .MC_Input(SROut), .MC_Output(MCOut), .s3(s3));
/////////////////////////////////////////////////////////////////////////////////////
// output of mixColumns is registered in REG1
wire [127:0] regOut;
GeneralReg REG1 (.Data(MCOut), .clk(clock), .Q(regOut),.enable(reg1_EN));     
//////////////////////////////////////////////////////////////////////////

// Add round key stage
reg [127:0]key; 
wire [127:0]newKey;
addroundkey U5( clock , key, newKey ,s4 );

wire [127:0] RKop;
assign RKop = newKey ^regOut;

////////////////////////////////////////////////////////////////////////
// output register
always @(posedge clock)
begin
    if(outEN==1)
        encryptedOut <= RKop;
        
end

// MUXs to choose between the given input or the feedback output (new generated key and the output of round n-1 to go in round n
always @(*)   
begin
    case(s4)
        1'b0: key <= cypherKey; 
        1'b1: key <= newKey;
    endcase

    case (in_Pass)
        1'b0: SBInput<= RKop;
        1'b1: SBInput<= dataToEncrypt;
    endcase
end

endmodule
