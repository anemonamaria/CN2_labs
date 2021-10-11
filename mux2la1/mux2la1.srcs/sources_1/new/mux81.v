`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2021 04:37:14 PM
// Design Name: 
// Module Name: mux81
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
module mux21(a, b, sol, o);
input a, b, sol;
output o;

assign o = (sol == 1) ? a : b;

// 0 0 0 -
// 0 0 1 -
// 0 1 0 -
endmodule

module mux81(a,b,c,d,e,f,g,h, ctrl, o);
input a,b,c,d,e,f,g,h;
input [2:0] ctrl;
output o;
reg aux;
always @(a,b,c,d,e,f,g,h, ctrl)
begin
    if (ctrl == 3'b000) begin
        aux = a;
    end
    else if (ctrl ==3'b001) begin
        aux = b;
    end
end   

assign o = aux;
endmodule


module myreg(d, clk, o);
input d, clk;
output reg o;

always @(posedge clk)
    o = d;
endmodule