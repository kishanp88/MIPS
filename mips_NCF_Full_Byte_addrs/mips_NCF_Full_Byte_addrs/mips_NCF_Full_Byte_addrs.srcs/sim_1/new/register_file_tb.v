`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2022 15:21:45
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb();
reg [4:0] src1_addr;
reg [4:0] src2_addr;
reg [4:0] dst_addr;
reg [31:0]write_data;
reg wren, clk;
wire [31:0] src1_data, src2_data;

register_file rf1(src1_addr, src2_addr, 
dst_addr, write_data, wren, clk, src1_data, src2_data);

initial clk = 0;
always clk = #5 ~clk;

 
initial
begin
    src1_addr = 5'h14; src2_addr = 5'h14;
    wren = 1'b0; dst_addr = 5'h14;
    #12 write_data = 32'h454;
    #3 wren = 1'b1; 
    #5 wren = 1'b0;
    #20 $finish ;
end  
endmodule
