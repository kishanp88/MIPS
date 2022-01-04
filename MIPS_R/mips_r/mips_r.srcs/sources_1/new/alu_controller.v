`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 16:34:48
// Design Name: 
// Module Name: alu_controller
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


module alu_controller(aluen, funct, alu_function, is_shamt);
input aluen;
input [5:0] funct;
output reg [2:0] alu_function;
output reg is_shamt;
parameter ADD = 6'h20, AND = 6'h24, OR = 6'h25, SUB = 6'h22, LEFT_SHIFT = 6'h00, RIGHT_SHIFT = 6'h02;

always @(*)
begin
    if(aluen)
    begin
        case (funct)
            ADD: alu_function = 3'b010;
            AND: alu_function = 3'b000;
            OR: alu_function = 3'b001;
            SUB: alu_function = 3'b110;
            LEFT_SHIFT: alu_function = 3'b100; 
            RIGHT_SHIFT: alu_function = 3'b101;
        endcase
    end
end

always @(*)
begin
if(aluen)
begin
    if((funct == LEFT_SHIFT) ||  (funct == RIGHT_SHIFT))
        is_shamt = 1;
    else
        is_shamt = 0;
end
end
endmodule
