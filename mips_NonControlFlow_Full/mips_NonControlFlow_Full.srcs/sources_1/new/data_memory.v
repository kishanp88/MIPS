`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2022 22:47:53
// Design Name: 
// Module Name: data_memory
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


module data_memory(address, write_datamemory, memory_rden, memory_wren, read_datamemory,clk);
input [31:0] address, write_datamemory;
input memory_rden, memory_wren,clk;
output [31:0] read_datamemory;

parameter DEPTH = 10;
reg [31:0] data_mem [DEPTH:0];
initial
begin
data_mem[0] = 32'h00201020;
data_mem[1] = 32'h00622022;

end

assign read_datamemory = data_mem[address];

always@(posedge clk)
begin
 if(memory_wren)
  data_mem[address] <= write_datamemory; 
end
endmodule
