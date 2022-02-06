`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2022 15:10:46
// Design Name: 
// Module Name: register_file
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


module register_file(src1_addr, src2_addr, 
dst_addr, write_data, wren, clk, src1_data, src2_data);

input [4:0] src1_addr;
input [4:0] src2_addr;
input [4:0] dst_addr;
input [31:0]write_data;
input wren, clk;
output [31:0] src1_data, src2_data;

reg [31:0] reg_file [31:0];

initial
begin
reg_file[0] = 32'h2;
reg_file[1] = 32'h1;

reg_file[3] = 32'h7;

reg_file[5] = 32'hA;

reg_file[7] = 32'h8;
reg_file[11] = 32'h3;


reg_file[15] = 32'h1;
reg_file[16] = 32'h16;
reg_file[17] = 32'h17;
reg_file[18] = 32'h18;

reg_file[23] = 32'h18;

end

assign src1_data = reg_file[src1_addr];
assign src2_data = reg_file[src2_addr]; 
   

always @(posedge clk)
    begin
        if (wren)
           reg_file[dst_addr] <= write_data;       
     
    end
endmodule
