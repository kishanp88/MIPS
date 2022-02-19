`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2022 23:05:31
// Design Name: 
// Module Name: data_memory_tb
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


module data_memory_tb();
reg [31:0] address, write_datamemory;
reg memory_rden, memory_wren,clk;
wire [31:0] read_datamemory;

data_memory DM1 (address, write_datamemory, memory_rden, memory_wren, read_datamemory, clk);

initial clk = 0;
always clk = #5 ~clk;

initial
begin
    memory_wren = 1'b0; memory_rden=1'b0;
    #12 write_datamemory = 32'h454;  address = 32'h10; memory_wren = 1'b1;
    #10 memory_wren = 1'b0; memory_rden = 1'b1;
    #10 address = 32'h0;
    #10 address = 32'h1;
    #10 address = 32'h4;
    #20 $finish ;
end  

endmodule
