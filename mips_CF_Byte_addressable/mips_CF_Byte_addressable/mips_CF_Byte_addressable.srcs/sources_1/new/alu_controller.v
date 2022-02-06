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


module alu_controller(aluen, funct, alu_opcode, alu_function, is_shamt,is_JType,is_JRType);
input aluen;
input [5:0] funct, alu_opcode;
output reg [2:0] alu_function;
output reg is_shamt,is_JType,is_JRType;
parameter ADD = 6'h20, AND = 6'h24, OR = 6'h25, SUB = 6'h22, LEFT_SHIFT = 6'h00, RIGHT_SHIFT = 6'h02,
ADDI = 6'h8, ANDI = 6'hC, ORI = 6'hD, LWI = 6'h23, SWI = 6'h2b, J = 6'h02, JR = 6'h08 , RType = 6'h00;

always @(*)
begin
    if(aluen)
    begin
    if(alu_opcode == RType)
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
     else
     begin
        case (alu_opcode)
            ADDI: alu_function = 3'b010;
            ANDI: alu_function = 3'b000;
            ORI: alu_function = 3'b001;
            LWI: alu_function = 3'b010;
            SWI: alu_function = 3'b010;
        endcase
     end
    end
end

always @(*)
begin
if(aluen && (alu_opcode == 6'h0))
begin
    if((funct == LEFT_SHIFT) ||  (funct == RIGHT_SHIFT))
        is_shamt = 1;
    else
        is_shamt = 0;
end
else 
is_shamt = 0;
end


always @(*)
begin
if(alu_opcode == J)
begin
  is_JType <= 1;
  is_JRType <= 0;
end


else if(alu_opcode == RType && funct == JR )
begin
  is_JType <= 1;
  is_JRType <= 1;
end

else
begin
  is_JType <= 0;
  is_JRType <= 0;
end
end

endmodule


