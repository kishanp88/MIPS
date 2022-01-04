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


module alu_controller(aluen, funct, alu_function);
input aluen;
input [5:0] funct;
output reg [2:0] alu_function;
parameter ADD = 6'h20, AND = 6'h24, OR = 6'h25, SUB = 6'h22;

always @(*)
begin
    if(aluen)
    begin
        case (funct)
            ADD: alu_function = 3'b010;
            AND: alu_function = 3'b000;
            OR: alu_function = 3'b001;
            SUB: alu_function = 3'b110;
        endcase
    end
end

endmodule
