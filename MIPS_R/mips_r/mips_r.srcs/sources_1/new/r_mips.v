`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 16:56:51
// Design Name: 
// Module Name: r_mips
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


module r_mips(clk, reset, src1_data, src2_data, write_data);
input clk, reset;
output [31:0] src1_data, write_data, src2_data;

wire [31:0]pc_next_w, pc_input_w;
wire [31:0] instruction_w, src2_data_w;
wire [2:0] alu_function_w;
wire aluen_w, wren_w;


alu a1(src1_data, src2_data, alu_function_w, write_data);
alu_controller alu1(aluen_w, instruction_w[5:0], alu_function_w);
instruction_memory i1(pc_next_w, instruction_w);
main_controller m1(instruction_w[31:26], clk, reset, wren_w, aluen_w, pc_input_w);
program_counter p1(clk, pc_input_w, pc_next_w);
register_file r1(instruction_w[25:21], instruction_w[20:16], instruction_w[15:11], write_data, wren_w, clk, src1_data, src2_data);

endmodule
