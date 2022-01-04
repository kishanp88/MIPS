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
wire [31:0] src1_data, write_data, src2_data;

r_mips r1(clk, reset, src1_data, src2_data, write_data);

initial clk = 0;
always clk = #5 ~clk;

initial
begin
    reset = 1'b1; 
    # 40 reset = 1'b0;
 
    #100 $finish ;
end 
endmodule
