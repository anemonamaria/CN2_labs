`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 07:34:34 PM
// Design Name: 
// Module Name: IF
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



//////////////////////////////////////////////IF//////////////////////////////////////////////////////////////
module IF (input clk,reset,PCSrc,PC_write, 
           input [31:0] PC_Branch, 
           output [31:0] PC_IF, INSTRUCTION_IF);
           ////
   wire [31:0] out_mux;
   wire [31:0] out_PC;
   wire [31:0] out_addr;
   
   mux2_1 mux(out_addr, PC_Branch, PCSrc, out_mux);
   PC pc(clk, reset, PC_write, out_mux, out_PC);
   instruction_memory mem(out_PC, INSTRUCTION_IF);
   adder add(out_PC, 4, out_adder);
   
   assign PC_IF = out_PC;
   
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
