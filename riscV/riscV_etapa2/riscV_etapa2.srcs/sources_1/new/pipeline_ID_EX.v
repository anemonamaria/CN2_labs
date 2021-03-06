`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2021 01:57:29 PM
// Design Name: 
// Module Name: pipeline_ID_EX
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



module pipeline_ID_EX(input clk, reset, write,
                      input MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc,
                      input [1:0] ALUop,
                      input [31:0] READ_DATA1, READ_DATA2,
                      input [31:0] IMM_ID,
                      input [2:0] FUNCT3_ID,
                      input [6:0] FUNCT7_ID,
                      input [6:0] OPCODE_ID,
                      input [4:0] RD_ID,
                      input [4:0] RS1_ID,
                      input [4:0] RS2_ID, 
                      input [31:0] PC_ID,
                      output reg MemRead_out, MemtoReg_out, MemWrite_out, RegWrite_out, Branch_out, ALUSrc_out,
                      output reg [1:0] ALUop_out, 
                      output reg [31:0] READ_DATA1_out,READ_DATA2_out,
                      output reg [31:0] IMM_ID_out,
                      output reg [2:0] FUNCT3_ID_out,
                      output reg [6:0] FUNCT7_ID_out,
                      output reg [6:0] OPCODE_ID_out,
                      output reg [4:0] RD_ID_out,
                      output reg [4:0] RS1_ID_out,
                      output reg [4:0] RS2_ID_out,
                      output reg [31:0] PC_ID_out);
                        
    always@(posedge clk)
    begin
        if (reset)
        begin
            MemRead_out <= 0;
            MemtoReg_out <= 0;
            MemWrite_out <= 0;
            RegWrite_out <= 0;
            Branch_out <= 0;
            ALUSrc_out <= 0;
            ALUop_out <= 0; 
            READ_DATA1_out <= 0;
            READ_DATA2_out <= 0;
            IMM_ID_out <= 0;
            FUNCT3_ID_out <= 0;
            FUNCT7_ID_out <= 0;
            OPCODE_ID_out <= 0;
            RD_ID_out <= 0;
            RS1_ID_out <= 0;
            RS2_ID_out <= 0;
            PC_ID_out <= 0;
        end  
        else begin
        if(write)
        begin
            MemRead_out <= MemRead;
            MemtoReg_out <= MemtoReg;
            MemWrite_out <= MemWrite;
            RegWrite_out <= RegWrite;
            Branch_out <= Branch;
            ALUSrc_out <= ALUSrc;
            ALUop_out <= ALUop; 
            READ_DATA1_out <= READ_DATA1;
            READ_DATA2_out <= READ_DATA2;
            IMM_ID_out <= IMM_ID;
            FUNCT3_ID_out <= FUNCT3_ID;
            FUNCT7_ID_out <= FUNCT7_ID;
            OPCODE_ID_out <= OPCODE_ID;
            RD_ID_out <= RD_ID;
            RS1_ID_out <= RS1_ID;
            RS2_ID_out <= RS2_ID;
            PC_ID_out <= PC_ID;
        end
        end
    end
endmodule