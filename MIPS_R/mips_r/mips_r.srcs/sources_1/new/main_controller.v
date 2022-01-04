`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 15:46:14
// Design Name: 
// Module Name: main_controller
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


module main_controller(opcode, clk, reset, wren, aluen, pc_input);
input clk, reset;
input [5:0] opcode;
output reg [31:0] pc_input;
output reg wren, aluen;
parameter R_TYPE = 6'h0;

always @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        pc_input <= 32'h0;
        wren <= 0;
        aluen <= 0;
    end
    else
    begin
        pc_input <= pc_input + 1;
        if(opcode == R_TYPE)
        begin
            wren <= 1'b1;
            aluen <= 1'b1;
        end
    end
end
 
endmodule
