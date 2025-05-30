`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2025 02:22:42 PM
// Design Name: 
// Module Name: fetch_cycle_tb
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


module fetch_cycle_tb();
reg clk = 0, rst, PCSrcE;
reg [31:0] PCTargetE;
wire [31:0]InstrD, PCD, PCPlus4D;

fetch_cycle dut(.clk(clk), .rst(rst), .PCSrcE(PCSrcE), .PCTargetE(PCTargetE), .InstrD(InstrD), .PCD(PCD), .PCPlus4D(PCPlus4D));
//Generation of clock
always begin
clk = ~clk;
#50;
end
//Provide the stimulus
initial begin
rst <= 1'b0;
#200;
rst <= 1'b1;
PCSrcE <= 1'b0;
PCTargetE <= 32'h00000000;
#500;
$finish;
end

//Generation of VCD file
initial begin
$dumpfile("dump.vcd");
$dumpvars(0);
end
endmodule
