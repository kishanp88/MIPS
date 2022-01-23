`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2022 16:43:30
// Design Name: 
// Module Name: mux_2_1_32bit_tb
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


module mux_2_1_32bit_tb();
reg [31:0] input_0, input_1;
reg select;
wire [31:0] output_data;

mux_2_1_32bit mux11(input_0, input_1, select ,output_data);

initial
begin
    input_0 = 32'h444;input_1 = 32'h555; select = 1'b0;
    #10 select = 1'b1;
    
    #20 $finish ;
end 
endmodule
