`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2022 10:01:52
// Design Name: 
// Module Name: jump_address
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


module jump_address(pc_next,instruction,pc_jump_uc, pc_branch);
 input [3:0] pc_next;
 input [25:0] instruction;
 output [31:0] pc_jump_uc;
 output [31:0] pc_branch;
 
 assign pc_jump_uc = {pc_next,instruction,2'b0}; //for j and jal
 assign pc_branch = {{14{instruction[15]}}, instruction[15:0], 2'b0};
endmodule
