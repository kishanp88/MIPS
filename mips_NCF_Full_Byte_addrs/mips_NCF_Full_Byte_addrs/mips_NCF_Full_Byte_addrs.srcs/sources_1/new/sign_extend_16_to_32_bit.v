`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2022 21:11:04
// Design Name: 
// Module Name: sign_extend_16_to_32_bit
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


module sign_extend_16_to_32_bit(immediate, extended_immediate);
input [15:0] immediate;
output reg [31:0] extended_immediate;
always @(*)
    begin
        extended_immediate[31:0] <= {{16{immediate[15]}},immediate[15:0]};
    end
endmodule
