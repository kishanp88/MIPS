`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 14:29:31
// Design Name: 
// Module Name: program_counter_tb
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


module program_counter_tb();
reg [31:0] pc_input;
reg clk;
wire [31:0] pc_next;

program_counter pc1(clk, pc_input, pc_next);

initial clk = 0;
always clk = #5 ~clk;

initial
begin
    pc_input = #2 32'h6; 
 
    #80 $finish ;
end 
endmodule
