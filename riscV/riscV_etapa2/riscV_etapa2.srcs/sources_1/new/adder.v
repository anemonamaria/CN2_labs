`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 08:00:10 PM
// Design Name: 
// Module Name: adder
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

////////////////////////////////////////////ADDER_MODULE//////////////////////////////////////////////////////
module adder(input [31:0] ina,inb,
             output reg [31:0] out);
  
  always@(ina,inb) begin
    out = ina+inb;
  end

endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
