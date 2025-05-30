`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2025 06:32:00 PM
// Design Name: 
// Module Name: PC_Module
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


module PC_Module(clk, rst, PC, PC_Next);
input clk, rst;
input [31:0]PC_Next;
output [31:0]PC;
reg [31:0]PC;

always@(posedge clk)
begin
if(rst == 1'b0)//Active low Reset(PC updates when reset is low)
PC <= {32{1'b0}};
else
PC <= PC_Next;
end
endmodule
