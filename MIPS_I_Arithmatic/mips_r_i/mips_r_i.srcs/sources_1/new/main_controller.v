//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 03.01.2022 15:46:14
//// Design Name: 
//// Module Name: main_controller
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module main_controller(opcode, clk, reset, wren, aluen, pc_input, is_IType, alu_opcode);
//input clk, reset;
//input [5:0] opcode;
//output reg [31:0] pc_input;
//output reg wren, aluen, is_IType;
//output reg [5:0] alu_opcode;
//parameter R_TYPE = 6'h0, ADDI = 6'h8, ANDI = 6'hC, ORI = 6'hD;

//always @(posedge clk, posedge reset)
//begin
//    if(reset)
//    begin
//        pc_input = 32'h0;
//        wren = 0;
//        aluen = 0;
//        is_IType = 0;
//        alu_opcode = 6'h0;
//    end
//    else
//    begin
//        pc_input = pc_input + 1;
//        alu_opcode = opcode;
//        if(opcode == R_TYPE)
//        begin
//            wren = 1'b1;
//            aluen = 1'b1;
//            is_IType = 1'b0;
            
//        end
//        else if(opcode == ADDI || opcode == ANDI || opcode == ORI)
//        begin
//            wren = 1'b1;
//            aluen = 1'b1;
//            is_IType = 1'b1;
            
//        end
//    end
//end
 
//endmodule


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


module main_controller(opcode, clk, reset, wren, aluen, pc_input, is_IType, alu_opcode);
input clk, reset;
input [5:0] opcode;
output reg [31:0] pc_input;
output reg wren, aluen, is_IType;
output reg [5:0] alu_opcode;
parameter R_TYPE = 6'h0, ADDI = 6'h8, ANDI = 6'hC, ORI = 6'hD;

//always @(posedge clk, posedge reset)
//begin
//    if(reset)
//    begin
//        pc_input = 32'h0;
//        wren = 0;
//        aluen = 0;
//        is_IType = 0;
//        alu_opcode = 6'h0;
//    end
//    else
//    begin
//        pc_input = pc_input + 1;
//        alu_opcode = opcode;
//        if(opcode == ADDI || opcode == ANDI || opcode == ORI)
//        begin
//            wren = 1'b1;
//            aluen = 1'b1;
//            is_IType = 1'b1;
            
//        end
//        else if(opcode == R_TYPE)
//        begin
//            wren = 1'b1;
//            aluen = 1'b1;
//            is_IType = 1'b0;
            
//        end
//    end
//end

always @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        pc_input <= 32'h0;
        wren <= 0;
        aluen <= 0;
        is_IType <= 0;
        alu_opcode <= 6'h0;
    end
end
    
always @(posedge clk, posedge reset)
begin
    if(~reset)
    begin
        pc_input = pc_input + 1;
        alu_opcode = opcode;
    end
end

always @(posedge clk, posedge reset)
begin
    if(~reset)
        begin
            if(opcode == ADDI || opcode == ANDI || opcode == ORI)
                begin
                    wren <= 1'b1;
                    aluen <= 1'b1;
                    is_IType <= 1'b1;
                end
        end
end

always @(posedge clk, posedge reset)
begin
    if(~reset)
        begin
            if(opcode == R_TYPE)
                begin
                    wren <= 1'b1;
                    aluen <= 1'b1;
                    is_IType <= 1'b0;
            
                end
        end
end
 
endmodule
