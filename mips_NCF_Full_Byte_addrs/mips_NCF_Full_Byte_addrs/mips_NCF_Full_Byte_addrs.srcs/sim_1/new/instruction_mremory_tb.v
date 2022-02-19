`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2022 14:40:07
// Design Name: 
// Module Name: instruction_mremory_tb
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


module instruction_mremory_tb();
reg [31:0] pc_next;
wire [31:0] instruction;

instruction_memory i1(pc_next, instruction);

initial
begin
    pc_next = 32'h0;
    #10 pc_next = 32'h1;
    #10 pc_next = 32'h2;
    #10 pc_next = 32'h3;
    #10 pc_next = 32'h4;
    #10 pc_next = 32'h5;
    #10 pc_next = 32'h6;
    #10 pc_next = 32'h7;
    #20 $finish ;
end  



endmodule
