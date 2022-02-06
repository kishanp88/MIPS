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


module r_mips(clk, reset, src1_data, alu_in2, alu_output_data, src_immediate_w, immediate_w, is_IType_w, instruction_w, alu_function_w, alu_opcode_w, is_load_w, is_store_w, read_datamemory_w, src2_data, wren_w,is_JType_w,is_JRType_w,pc_next_w,is_JROut_w);
input clk, reset;
output [31:0] src1_data, alu_output_data, alu_in2, src_immediate_w, immediate_w, instruction_w;
output [2:0] alu_function_w;
output [5:0] alu_opcode_w;
output is_IType_w;
output is_load_w,is_store_w,is_JType_w,is_JRType_w;
output [31:0] read_datamemory_w,pc_next_w;
output wren_w;
wire [31:0] pc_input_w, write_data_w, pc_input_add_w,pc_jump_uc_w;
output [31:0] src2_data;
//wire [2:0] alu_function_w;
wire aluen_w, is_shamt_w;
wire [4:0] write_addr_w;
//wire [5:0] alu_opcode_w;
output [31:0] is_JROut_w;

alu a1(src1_data, alu_in2, alu_function_w, alu_output_data);
alu_controller alu1(aluen_w, instruction_w[5:0], alu_opcode_w, alu_function_w, is_shamt_w,is_JType_w,is_JRType_w);
instruction_memory i1(pc_next_w, instruction_w);
main_controller m1(instruction_w[31:26], reset, wren_w, aluen_w, is_IType_w, alu_opcode_w, is_load_w, is_store_w);
program_counter p1(clk, reset, pc_input_w, pc_next_w);
register_file r1(instruction_w[25:21], instruction_w[20:16], write_addr_w, write_data_w, wren_w, clk, src1_data, src2_data);
mux_2_1_32bit mux1(src_immediate_w, {27'h0,instruction_w[10:6]}, is_shamt_w ,alu_in2);

sign_extend_16_to_32_bit se1(instruction_w[15:0], immediate_w);
mux_2_1_32bit mux2(src2_data, immediate_w, is_IType_w ,src_immediate_w);
mux_2_1_5bit mux3(instruction_w[15:11], instruction_w[20:16], is_IType_w ,write_addr_w);

pc_adder pcadd1(pc_next_w, pc_input_add_w);

data_memory D1 (alu_output_data, src2_data, is_load_w, is_store_w, read_datamemory_w, clk);
mux_2_1_32bit mux4(alu_output_data, read_datamemory_w, is_load_w ,write_data_w);

//for j and jalr
mux_2_1_32bit isJType(pc_input_add_w, is_JROut_w, is_JType_w ,pc_input_w);
jump_address j1(pc_next_w[31:28],instruction_w[25:0],pc_jump_uc_w);
mux_2_1_32bit isJR(pc_jump_uc_w,src1_data, is_JRType_w ,is_JROut_w);
endmodule
