`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 13:53:06
// Design Name: 
// Module Name: alu
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


module alu(src1_data, src2_data, alu_function, write_data);

input [31:0] src1_data, src2_data;
input [2:0] alu_function;
output reg [31:0] write_data;

always @(*)
    begin
        case (alu_function)
            3'b000: write_data = src1_data & src2_data;
            3'b001: write_data = src1_data | src2_data;
            3'b010: write_data = src1_data + src2_data;
            3'b011: write_data = 32'h0;
            3'b100: write_data = src1_data << src2_data;
            3'b101: write_data = src1_data >> src2_data;
            3'b110: write_data = src1_data - src2_data;
            3'b111: write_data = (src1_data < src2_data)? 1:0;
            default: write_data = 32'h0;
        endcase
    end    
endmodule
