`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2022 15:36:15
// Design Name: 
// Module Name: branch_address_adder
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


module branch_address_adder(input_0, input_1, branch_address);
input [31:0] input_0, input_1;
output [31:0] branch_address;

assign branch_address = input_0 + input_1;
endmodule
