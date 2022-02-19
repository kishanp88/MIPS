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


module r_mips(clk, reset, src1_data, src2_data_w, write_data, src_immediate_w, immediate_w, is_IType_w, instruction_w, alu_function_w, alu_opcode_w);
input clk, reset;
output [31:0] src1_data, write_data, src2_data_w, src_immediate_w, immediate_w, instruction_w;
output [2:0] alu_function_w;
output [5:0] alu_opcode_w;
output is_IType_w;
wire [31:0]pc_next_w, pc_input_w;
wire [31:0] src2_data;
//wire [2:0] alu_function_w;
wire aluen_w, wren_w, is_shamt_w;
wire [4:0] write_addr_w;
//wire [5:0] alu_opcode_w;

alu a1(src1_data, src2_data_w, alu_function_w, write_data);
alu_controller alu1(aluen_w, instruction_w[5:0], alu_opcode_w, alu_function_w, is_shamt_w);
instruction_memory i1(pc_next_w, instruction_w);
main_controller m1(instruction_w[31:26], reset, wren_w, aluen_w, is_IType_w, alu_opcode_w);
program_counter p1(clk, reset, pc_input_w, pc_next_w);
register_file r1(instruction_w[25:21], instruction_w[20:16], write_addr_w, write_data, wren_w, clk, src1_data, src2_data);
mux_2_1_32bit mux1(src_immediate_w, {27'h0,instruction_w[10:6]}, is_shamt_w ,src2_data_w);

sign_extend_16_to_32_bit se1(instruction_w[15:0], immediate_w);
mux_2_1_32bit mux2(src2_data, immediate_w, is_IType_w ,src_immediate_w);
mux_2_1_5bit mux3(instruction_w[15:11], instruction_w[20:16], is_IType_w ,write_addr_w);

pc_adder pcadd1(pc_next_w, pc_input_w);
endmodule
