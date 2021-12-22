`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 08:25:51 PM
// Design Name: 
// Module Name: registers
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


///////////////////////////////////REGISTER_FILE_MODULE///////////////////////////////////////////////////////
module registers(input clk,reg_write,
                 input [4:0] read_reg1,read_reg2,write_reg,
                 input [31:0] write_data,
                 output [31:0] read_data1,read_data2);
reg [31:0] x [0:31];
    reg[31:0] rdata1, rdata2;
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
        begin
        x[i] = i;
        end
    end
  
  always@(posedge clk)
    begin
        if (reg_write && write_reg)
        begin
            x[write_reg] <= write_data;
        end
    end
    
    always@(read_reg1 or read_reg2)
    begin
        rdata1 = x[read_reg1];
        rdata2 = x[read_reg2];
    end
    
    assign read_data1 = rdata1;
    assign read_data2 = rdata2;
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
