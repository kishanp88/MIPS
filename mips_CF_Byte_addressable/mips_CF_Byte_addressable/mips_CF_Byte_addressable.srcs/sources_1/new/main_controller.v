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


module main_controller(opcode, reset, wren, aluen, is_IType, alu_opcode, is_load, is_store);
input reset;
input [5:0] opcode;
output reg wren, aluen, is_IType, is_load, is_store;
output reg [5:0] alu_opcode;
parameter R_TYPE = 6'h0, ADDI = 6'h8, ANDI = 6'hC, ORI = 6'hD, LWI = 6'h23, SWI = 6'h2b  ;

always @(*)
begin
    if(reset)
    begin
        wren <= 0;
        aluen <= 0;
        is_IType <= 0;
        alu_opcode <= 6'h0;
        is_load <= 1'b0;
        is_store <= 1'b0;
    end
    else
    begin
        
        alu_opcode = opcode;
        if(opcode == R_TYPE)
        begin
            wren <= 1'b1;
            aluen <= 1'b1;
            is_IType <= 1'b0;
            is_load <= 1'b0;
            is_store <= 1'b0;
          
        end
        else if(opcode == ADDI || opcode == ANDI || opcode == ORI)
        begin
            wren <= 1'b1;
            aluen <= 1'b1;
            is_IType <= 1'b1;   
            is_load <= 1'b0;
            is_store <= 1'b0;
         
        end
        else if (opcode == LWI)
         begin
            wren <= 1'b1;
            aluen <= 1'b1;
            is_IType <= 1'b1;
            is_load <= 1'b1;
            is_store <= 1'b0;  
          
         end   
         else if (opcode == SWI)
          begin
             wren <= 1'b0;
             aluen <= 1'b1;
             is_IType <= 1'b1;
             is_load <= 1'b0; 
             is_store <= 1'b1;
           
          end  
          
    end
end
 
endmodule

