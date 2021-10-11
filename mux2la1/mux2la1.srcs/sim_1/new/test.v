`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2021 05:17:05 PM
// Design Name: 
// Module Name: test
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


module test();
reg a, b, sol, clk;
wire o;

mux21 uut(a, b, sol, o);

always #25 clk = ~clk;
initial begin
    a = 0; b= 0; sol = 0;
    // #50; a=1; b=0; sol=0;
    #50; {a,b,sol} = {a,b,sol}+1;
    #50; {a,b,sol} = {a,b,sol}+1;
    #50; {a,b,sol} = {a,b,sol}+1;
    #50; {a,b,sol} = {a,b,sol}+1;
    #50; {a,b,sol} = {a,b,sol}+1;
end
endmodule
