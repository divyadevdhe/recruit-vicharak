`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2025 06:46:14 PM
// Design Name: 
// Module Name: Pipeline_Top
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


module Pipeline_Top(clk, rst);

input clk, rst;

wire PCSrcE, RegWriteW, RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE, RegWriteM,
ResultSrcW, MemWriteM, ResultSrcM;
wire [4:0] RD_E, RD_M, RDW;
wire [31:0]PCTargetE, InstrD, PCD, PCPlus4D, ResultW, RD1_E, RD2_E, Imm_Ext_E,PCE, PCPlus4E,
PCPlus4M, WriteDataM, ALU_ResultM, PCPlus4W, ALU_ResultW, ReadDataW;
wire [2:0]ALUControlE;

fetch_cycle FC(.clk(clk), 
               .rst(rst), 
               .PCSrcE(PCSrcE), 
               .PCTargetE(PCTargetE), 
               .InstrD(InstrD), 
               .PCD(PCD), 
               .PCPlus4D(PCPlus4D));

decode_cycle DC(.clk(clk),
             .rst(rst), 
             .InstrD(InstrD), 
             .PCD(PCD), 
             .PCPlus4D(PCPlus4D), 
             .RegWriteW(RegWriteW), 
             .RDW(RDW), 
             .ResultW(ResultW), 
             .RegWriteE(RegWriteE), 
             .ALUSrcE(ALUSrcE), 
             .MemWriteE(MemWriteE), 
             .ResultSrcE(ResultSrcE), 
             .BranchE(BranchE), 
             .ALUControlE(ALUControlE), 
             .RD1_E(RD1_E), 
             .RD2_E(RD2_E), 
             .Imm_Ext_E(Imm_Ext_E), 
             .RD_E(RD_E), 
             .PCE(PCE), 
             .PCPlus4E(PCPlus4E));

Execute_Cycle EC(.clk(clk), 
              .rst(rst), 
              .RegWriteE(RegWriteE), 
              .ALUSrcE(ALUSrcE), 
              .MemWriteE(MemWriteE), 
              .ResultSrcE(ResultSrcE),
              .BranchE(BranchE), 
              .ALUControlE(ALUControlE),
              .RD1_E(RD1_E), 
              .RD2_E(RD2_E), 
              .Imm_Ext_E(Imm_Ext_E), 
              .RD_E(RD_E), 
              .PCE(PCE), 
              .PCPlus4E(PCPlus4E),
              .PCSrcE(PCSrcE), 
              .PCTargetE(PCTargetE), 
              .RegWriteM(RegWriteM), 
              .MemWriteM(MemWriteM), 
              .ResultSrcM(ResultSrcM), 
              .RD_M(RD_M),
              .PCPlus4M(PCPlus4M), 
              .WriteDataM(WriteDataM), 
              .ALU_ResultM(ALU_ResultM));

Memory_Cycle MC(.clk(clk),
             .rst(rst), 
             .RegWriteM(RegWriteM), 
             .MemWriteM(MemWriteM), 
             .ResultSrcM(ResultSrcM), 
             .RD_M(RD_M), 
             .PCPlus4M(PCPlus4M), 
             .WriteDataM(WriteDataM), 
             .ALU_ResultM(ALU_ResultM), 
             .RegWriteW(RegWriteW), 
             .ResultSrcW(ResultSrcW), 
             .RD_W(RDW), 
             .PCPlus4W(PCPlus4W), 
             .ALU_ResultW(ALU_ResultW), 
             .ReadDataW(ReadDataW));

WriteBack_Cycle WC(.clk(clk),
                .rst(rst), 
                .ResultSrcW(ResultSrcW), 
                .PCPlus4W(PCPlus4W), 
                .ALU_ResultW(ALU_ResultW), 
                .ReadDataW(ReadDataW), 
                .ResultW(ResultW));
endmodule
