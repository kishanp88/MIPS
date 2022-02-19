`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 14:25:03
// Design Name: 
// Module Name: program_counter
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


module program_counter(clk, reset, pc_input, pc_next);
input clk, reset;
input [31:0] pc_input;
output reg [31:0] pc_next;


always @(posedge clk, posedge reset)
begin
       if(reset)
       pc_next <= 32'h0;
       else
       pc_next <= pc_input;
   
end

endmodule
