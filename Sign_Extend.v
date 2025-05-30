`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 03:24:52 PM
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend(In, ImmSrc, Imm_Ext);
input [31:0]In;
input [1:0]ImmSrc;
output [31:0]Imm_Ext;
assign Imm_Ext = (ImmSrc == 2'b00) ? {{20{In[31]}}, In[31:25], In[11:7]}: 32'h00000000;
endmodule
