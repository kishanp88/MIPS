`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 16:28:55
// Design Name: 
// Module Name: main_controller_tb
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


module main_controller_tb();
reg clk, reset;
reg [5:0] opcode;
wire [31:0] pc_input;
wire [5:0] alu_opcode;
wire wren, aluen, is_IType;

main_controller m1(opcode, clk, reset, wren, aluen, pc_input, is_IType, alu_opcode);

initial clk = 0;
always clk = #5 ~clk;

initial
begin
    reset = 1'b1; 
    opcode = 6'h0;
    # 45 reset = 1'b0;
 #10 opcode = 6'h8;
 #10 opcode = 6'h0;
 #10 opcode = 6'hC;
 #10 opcode = 6'hD;
    #80 $finish ;
end 
endmodule
