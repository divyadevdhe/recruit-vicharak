`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2025 11:21:50 AM
// Design Name: 
// Module Name: fetch_cycle
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


module fetch_cycle(clk, rst, PCSrcE, PCTargetE, InstrD, PCD, PCPlus4D);
input clk, rst;
input PCSrcE;
input [31:0]PCTargetE;
output [31:0]InstrD;
output [31:0]PCD, PCPlus4D;

wire [31:0]PC_F, PCF, PCPlus4F;
wire [31:0]InstrF;

reg [31:0]InstrF_reg;
reg [31:0]PCF_reg, PCPlus4F_reg;

//instantiating Modules
//Declare PC MUX
MUX PC_MUX(.a(PCPlus4F), .b(PCTarget), .s(PCSrcE), .c(PC_F));

//Declare PC Counter
PC_Module Program_Counter(.clk(clk), .rst(rst), .PC(PCF), .PC_Next(PC_F));

//Declare Instruction Memory
Instruction_Memory IMEM(.rst(rst), .A(PCF), .RD(InstrF));

//Declare PC Adder
PC_Adder PC_adder(.a(PCF), .b(32'h00000004), .c(PCPlus4F));

//Register Logic
always@(posedge clk or negedge rst) begin
if(rst == 1'b0) begin
InstrF_reg <= 32'h00000000;
PCF_reg <= 32'h00000000;
PCPlus4F_reg<= 32'h00000000;
end
else begin
InstrF_reg <= InstrF;
PCF_reg <= PCF;
PCPlus4F_reg<= PCPlus4F;
end
end

//Assigning the register value to the output port
assign InstrD  = (rst == 1'b0) ? 32'h00000000 : InstrF_reg;
assign PCD  = (rst == 1'b0) ? 32'h00000000 : PCF_reg;
assign PCPlus4D  = (rst == 1'b0) ? 32'h00000000 : PCPlus4F_reg;
endmodule
