`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:21:59 AM
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(ALUOp, funct3, funct7, Op, ALUControl);
input [1:0]ALUOp;
input[2:0]funct3;
input[2:0]funct7, Op;
output [2:0]ALUControl;

assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
(ALUOp == 2'b01) ? 3'b001 :
((ALUOp == 2'b10) & (funct3 == 3'b000) & ({Op[5], funct7[5]} == 2'b11))? 3'b001:
((ALUOp == 2'b10) & (funct3 == 3'b000) & ({Op[5], funct7[5]} != 2'b11))? 3'b000:
((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101:
((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011:
((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010: 3'b000;
endmodule
