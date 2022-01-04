`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 16:28:55
// Design Name: 
// Module Name: main_controller_tb
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


module main_controller_tb();
reg clk, reset;
reg [5:0] opcode;
wire [31:0] pc_input;
wire wren, aluen;

main_controller m1(opcode, clk, reset, wren, aluen, pc_input);

initial clk = 0;
always clk = #5 ~clk;

initial
begin
    reset = 1'b1; 
    opcode = 6'h0;
    # 40 reset = 1'b0;
 
    #80 $finish ;
end 
endmodule
