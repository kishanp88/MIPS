`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2022 14:32:31
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(pc_next, instruction);

input [31:0] pc_next;
output [31:0] instruction;
parameter DEPTH = 200;
reg [7:0] inst_mem [DEPTH:0];
initial
begin
{inst_mem[3],inst_mem[2],inst_mem[1],inst_mem[0]} = 32'h00201020; //ADD R2, R1, R0
{inst_mem[7],inst_mem[6],inst_mem[5],inst_mem[4]} = 32'h00622022; //SUB R4, R3, R2
{inst_mem[11],inst_mem[10],inst_mem[9],inst_mem[8]} = 32'h00A43025; //OR R6, R5, R4
{inst_mem[15],inst_mem[14],inst_mem[13],inst_mem[12]} = 32'h00E64024; //AND R8, R7, R6

{inst_mem[19],inst_mem[18],inst_mem[17],inst_mem[16]} = 32'h01004880; //LEFT SHIFT R9, R8, shamt = 2

{inst_mem[23],inst_mem[22],inst_mem[21],inst_mem[20]} = 32'h012050C2; //RIGHT SHIFT R10, R9, shamt = 3


{inst_mem[27],inst_mem[26],inst_mem[25],inst_mem[24]} = 32'h214B0005; //ADDI R11, R10, #5

{inst_mem[31],inst_mem[30],inst_mem[29],inst_mem[28]} = 32'h216CFFFE; //ADDI R12, R11, #-2

{inst_mem[35],inst_mem[34],inst_mem[33],inst_mem[32]} = 32'h318D0005; //ANDI R13, R12, #5

{inst_mem[39],inst_mem[38],inst_mem[37],inst_mem[36]} = 32'h35AE000A; //ORI R14, R13, #10


{inst_mem[43],inst_mem[42],inst_mem[41],inst_mem[40]} = 32'hADF00003; //SWI R16, 3(R15)

{inst_mem[47],inst_mem[46],inst_mem[45],inst_mem[44]} = 32'hADF10007; //SWI R17, 4(R15)

{inst_mem[51],inst_mem[50],inst_mem[49],inst_mem[48]} = 32'hADF2000B; //SWI R18, 5(R15)


{inst_mem[55],inst_mem[54],inst_mem[53],inst_mem[52]} = 32'h8DF30003; //LWI R19, 3(R15)

{inst_mem[59],inst_mem[58],inst_mem[57],inst_mem[56]} = 32'h8DF20007; //LWI R20, 4(R15)

{inst_mem[63],inst_mem[62],inst_mem[61],inst_mem[60]} = 32'h8DF5000B; //LWI R21, 5(R15)

 
{inst_mem[67],inst_mem[66],inst_mem[65],inst_mem[64]} = 32'h36B60000; //ORI R22, R21, #0

{inst_mem[71],inst_mem[70],inst_mem[69],inst_mem[68]} = 32'h08000014; // J 20 i.e 80
{inst_mem[83],inst_mem[82],inst_mem[81],inst_mem[80]} = 32'h36B60000; //ORI R22, R21, #0

{inst_mem[87],inst_mem[86],inst_mem[85],inst_mem[84]} = 32'h12F80005; //BEQ R23, R24, #5
{inst_mem[111],inst_mem[110],inst_mem[109],inst_mem[108]} = 32'h36B60000; //ORI R22, R21, #0

{inst_mem[115],inst_mem[114],inst_mem[113],inst_mem[112]} = 32'h17190004; // BNEQ R24, R25, #4
{inst_mem[135],inst_mem[134],inst_mem[133],inst_mem[132]} = 32'h36B60000; //ORI R22, R21, #0

//{inst_mem[87],inst_mem[86],inst_mem[85],inst_mem[84]} = 32'h02E00008; //JR R23 (6TH INSTRUCTION)

end

assign instruction = {inst_mem[pc_next + 3], inst_mem[pc_next + 2], inst_mem[pc_next + 1], inst_mem[pc_next]};

endmodule
