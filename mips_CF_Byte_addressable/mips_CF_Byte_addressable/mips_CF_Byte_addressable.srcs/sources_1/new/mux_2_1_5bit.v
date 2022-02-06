`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2022 21:08:12
// Design Name: 
// Module Name: mux_2_1_5bit
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

    
module mux_2_1_5bit(input_0, input_1, select ,output_data);
input [4:0] input_0, input_1;
input select;
output [4:0] output_data;

assign output_data = (select)? input_1:input_0 ;
endmodule

