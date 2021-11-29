`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 08:52:51 PM
// Design Name: 
// Module Name: risc_v_IF_ID
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

/////////////////////////////////////////////RISC_V_IF_ID/////////////////////////////////////////////////////
module RISC_V_IF_ID(input clk,reset,
                    input IF_ID_write, PCSrc, PC_write,
                    input [31:0] PC_Branch,
                    input RegWrite_WB,
                    input [31:0] ALU_DATA_WB,
                    input [4:0] RD_WB,
                    output [31:0] PC_ID, INSTRUCTION_ID, IMM_ID, REG_DATA1_ID, REG_DATA2_ID,
                    output [2:0] FUNCT3_ID,
                    output [6:0] FUNCT7_ID, OPCODE_ID,
                    output [4:0] RD_ID, RS1_ID, RS2_ID);
//PROBLEMA   ---> ex 8 am ramas
  always@(posedge clk) begin
        if (reset == 1) begin
            PC_ID <= 0;
            REG_DATA1_ID <= 0;
            REG_DATA2_ID <= 0;
            INSTRUCTION_ID <= 0;
            FUNCT7_ID <= 0;
            FUNCT3_ID <= 0;
            RS1_ID <= 0;
            RS2_ID <= 0;
            RD_ID <= 0;
        end else begin
            if (write == 1) begin
              /  PC_ID <= PC_Branch;
               // REG_DATA1_EX <= REG_DATA1_ID;
                //REG_DATA2_EX <= REG_DATA2_ID;
             //   IMM_EX <= IMM_ID;
               // FUNCT7_EX <= FUNCT7_ID;
            //    FUNCT3_EX <= FUNCT3_ID;
              //  RS1_EX <= RS1_ID;
             //   RS2_EX <= RS2_ID;
            //    RD_EX <= RD_ID;
            end
        end
    end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
