`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2021 01:36:02 PM
// Design Name: 
// Module Name: pipeline_ex_mem
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

module pipeline_ex_mem(input clk, reset, Zero,
                       input[31:0] ALU,
                       input[31:0] Adder,
                       input[31:0] mux,
                       input[4:0] RD,
                       input MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc,
                       input [1:0] ALUop,
                       
                       output reg Zero_out,
                       output reg[31:0] ALU_out,
                       output reg[31:0] Adder_out,
                       output reg[31:0] mux_out,
                       output reg[4:0] RD_out,
                       output reg MemRead_out, MemtoReg_out, MemWrite_out, RegWrite_out, Branch_out, ALUSrc_out,
                       output reg [1:0] ALUop_out
    );
    
    always@(posedge clk)
    begin
        if (reset)
            begin
                Adder_out <= 0;
                Zero_out <= 0;
                ALU_out <= 0;
                mux_out <= 0;
                RD_out <= 0;
                MemRead_out <= 0;
                MemtoReg_out <= 0;
                MemWrite_out <= 0;
                RegWrite_out <= 0;
                Branch_out <= 0;
                ALUSrc_out <= 0;
                ALUop_out <= 0;
            end
        else
            begin
                Adder_out <= Adder;
                Zero_out <= Zero;
                ALU_out <= ALU;
                mux_out <= mux;
                RD_out <= RD;
                MemRead_out <= MemRead;
                MemtoReg_out <= MemtoReg;
                MemWrite_out <= MemWrite;
                RegWrite_out <= RegWrite;
                Branch_out <= Branch;
                ALUSrc_out <= ALUSrc;
                ALUop_out <= ALUop;
            end
    end
endmodule
