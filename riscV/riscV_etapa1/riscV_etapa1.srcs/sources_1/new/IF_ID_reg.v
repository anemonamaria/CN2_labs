`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 08:48:11 PM
// Design Name: 
// Module Name: IF_ID_reg
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

////////////////////////////////////////PIPELINE_REG_MODULES///////////////////////////////////////////////////
module IF_ID_reg(input clk,reset,write,
                 input [31:0] pc_in,instruction_in,
                 output reg [31:0] pc_out,instruction_out);
  always@(posedge clk) begin
        if (reset) begin
          pc_out <= 0;
          instruction_out <= 0;
        end
        else begin
          if(write) begin
            pc_out <= pc_in;
            instruction_out <= instruction_in;
          end
        end
      end
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
