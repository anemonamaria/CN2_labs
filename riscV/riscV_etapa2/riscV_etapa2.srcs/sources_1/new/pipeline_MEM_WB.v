`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2021 01:36:02 PM
// Design Name: 
// Module Name: pipeline_MEM_WB
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

module pipeline_MEM_WB(input clk, reset,
                       input[31:0] Read_data,
                       input[31:0] Address, 
                       input[4:0] Rd,
                       input MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc,
                       input [1:0] ALUop,
                       
                       output reg[31:0] Readdata_out,
                       output reg[31:0] Address_out,
                       output reg[4:0] Rd_out,
                       output reg MemRead_out, MemtoReg_out, MemWrite_out, RegWrite_out, Branch_out, ALUSrc_out,
                       output reg [1:0] ALUop_out
 
    );
    
    always@(posedge clk)
    begin
        if (reset)
            begin
                Readdata_out <= 0;
                Address_out <= 0;
                Rd_out <= 0;
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
                Readdata_out <= Read_data;
                Address_out <= Address;
                Rd_out <= Rd;
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