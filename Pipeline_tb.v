`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2025 11:48:49 AM
// Design Name: 
// Module Name: Pipeline_tb
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


module Pipeline_tb();

reg clk=0, rst;

always begin
clk = ~clk;
#50;
end

initial begin
rst <= 1'b0;
#200;
rst <= 1'b1;
#1000;
$finish;
end

initial
begin
$dumpfile("dump.vcd");
$dumpvars(0);
end

Pipeline_Top dut(.clk(clk), .rst(rst));

endmodule
