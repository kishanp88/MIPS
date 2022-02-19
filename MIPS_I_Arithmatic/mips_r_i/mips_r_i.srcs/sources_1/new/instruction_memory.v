`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2022 14:32:31
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(pc_next, instruction);

input [31:0] pc_next;
output [31:0] instruction;
parameter DEPTH = 10;
reg [31:0] inst_mem [DEPTH:0];
initial
begin
inst_mem[0] = 32'h00201020;
inst_mem[1] = 32'h00622022;
inst_mem[2] = 32'h00A43025;
inst_mem[3] = 32'h00E64024;
inst_mem[4] = 32'h01004880;
inst_mem[5] = 32'h012050C2;
//inst_mem[6] = 32'h014B6020;
inst_mem[6] = 32'h214B0005;
inst_mem[7] = 32'h216CFFFE;
inst_mem[8] = 32'h318D0005;
inst_mem[9] = 32'h35AE000A;

end

assign instruction = inst_mem[pc_next];

endmodule
