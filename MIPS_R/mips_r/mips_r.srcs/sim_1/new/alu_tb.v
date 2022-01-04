`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 14:07:57
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
reg [31:0] src1_data, src2_data;
reg [2:0] alu_function;
wire [31:0] write_data;

alu a1(src1_data, src2_data, alu_function, write_data);

initial
begin
   src1_data = 32'h542; src2_data = 32'h777;
    #10 alu_function = 3'b000;
    #10 alu_function = 3'b001;
    #10 alu_function = 3'b010;
    #10 alu_function = 3'b011;
    #10 alu_function = 3'b100;
    #10 alu_function = 3'b101;
    #10 alu_function = 3'b110;
    #10 alu_function = 3'b111;
    #20 $finish ;
end  


endmodule
