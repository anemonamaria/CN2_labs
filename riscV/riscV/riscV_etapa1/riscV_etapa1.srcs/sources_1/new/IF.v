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
   wire[31:0] pc_rez, mux_rez, adder_rez;
   
   mux2_1 mux_op(adder_rez, PC_Branch, PCSrc, mux_rez);
   PC pc_op(clk, reset, PC_write, mux_rez, pc_rez);
   adder ad_op(pc_rez, 32'b0100, adder_rez);
   instruction_memory istruction_memory_op(pc_rez[11:2], INSTRUCTION_IF); 
   
   assign PC_IF = pc_rez;
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
