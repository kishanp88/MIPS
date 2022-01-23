`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 17:56:59
// Design Name: 
// Module Name: r_mips_tb
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


module r_mips_tb();
reg clk, reset;
wire [31:0] src1_data, write_data, alu_in2, src_immediate_w, immediate_w, instruction_w;
wire [2:0] alu_function_w;
wire [5:0] alu_opcode_w;
wire is_IType_w;
wire is_load_w;
wire is_store_w;
wire [31:0] src2_data,pc_next_w;
wire [31:0] read_datamemory_w;
wire wren_w;
wire is_JType_w;

r_mips r1(clk, reset, src1_data, alu_in2, write_data, src_immediate_w, immediate_w, is_IType_w, instruction_w, alu_function_w, alu_opcode_w, is_load_w, is_store_w, read_datamemory_w, src2_data, wren_w, is_JType_w,pc_next_w);

initial clk = 0;
always clk = #5 ~clk;

initial
begin
    reset = 1'b1; 
    # 40 reset = 1'b0;
 
    #200 $finish ;
end 
endmodule
