`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 16:45:18
// Design Name: 
// Module Name: alu_controller_tb
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


module alu_controller_tb();
reg aluen;
reg [5:0] funct, alu_opcode;
wire [2:0] alu_function;
wire is_shamt;

alu_controller a1(aluen, funct, alu_opcode, alu_function, is_shamt);
initial
begin
    aluen = 1'b1; 
    funct = 6'h20;
    alu_opcode = 6'b0; 
    # 20 funct = 6'h24;
    # 20 funct = 6'h25;
    # 20 alu_opcode = 6'h8;
    # 20 alu_opcode = 6'h0;
    # 20 funct = 6'h22;
    # 20 funct = 6'h00;
    # 20 alu_opcode = 6'hC;
    # 20 alu_opcode = 6'hD;
    # 20 alu_opcode = 6'h0;
    # 20 funct = 6'h02;
    
    #80 $finish ;
end 
endmodule
