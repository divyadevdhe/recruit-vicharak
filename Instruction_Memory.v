`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2025 01:41:11 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(rst, A, RD);
input rst;
input [31:0]A;
output [31:0]RD;
reg [31:0] mem[1023:0];

assign RD = (rst == 1'b0) ? {32{1'b0}}:mem[A[31:2]];

initial begin
$readmemh("memfile.hex", mem);
end
endmodule
