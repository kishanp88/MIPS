`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2022 21:19:42
// Design Name: 
// Module Name: sign_extend_16_to_32_bit_tb
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


module sign_extend_16_to_32_bit_tb();
reg [15:0] immediate;
wire [31:0] extended_immediate;

sign_extend_16_to_32_bit se1(immediate, extended_immediate);

initial
begin
    immediate = -16'h34; 
    
    #80 $finish ;
end 
endmodule
