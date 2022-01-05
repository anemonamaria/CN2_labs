`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2021 01:54:13 PM
// Design Name: 
// Module Name: control_path
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

//// what???
module control_path(input [6:0] opcode,
                    input control_sel,
                    output reg MemRead, MemtoReg, MemWrite, RegWrite, Branch, ALUSrc,
                    output reg [1:0] ALUop);

    always@(opcode,control_sel) begin
    casex({control_sel,opcode})
        8'b1xxxxxxx: begin          // control_sel == 1
                     ALUSrc <= 0;
                     MemtoReg <= 0; 
                     RegWrite <= 0;
                     MemRead <= 0;
                     MemWrite <= 0;
                     Branch <= 0;
                     ALUop<= 0;
                      end
        8'b00000000: begin          // nop from ISA
                     ALUSrc <= 0;
                     MemtoReg <= 0; 
                     RegWrite <= 0;
                     MemRead <= 0;
                     MemWrite <= 0;
                     Branch <= 0;
                     ALUop<= 0; 
                     end
        8'b00000011: begin          // ld
                     ALUSrc <= 1;
                     MemtoReg <= 1; 
                     RegWrite <= 1;
                     MemRead <= 1;
                     MemWrite <= 0;
                     Branch <= 0;
                     ALUop<= 0;
                     end
        8'b00100011: begin          // sd
                     ALUSrc <= 1;
                     MemtoReg <= 0; 
                     RegWrite <= 0;
                     MemRead <= 0;
                     MemWrite <= 1;
                     Branch <= 0;
                     ALUop<= 0; 
                     end 
        8'b00110011: begin          // R
                     ALUSrc <= 0;
                     MemtoReg <= 0; 
                     RegWrite <= 1;
                     MemRead <= 0;
                     MemWrite <= 0;
                     Branch <= 0;
                     ALUop<= 2'b10; 
                     end
        8'b00010011: begin          //Immediate
                     ALUSrc <= 1;
                     MemtoReg <= 0; 
                     RegWrite <= 1;
                     MemRead <= 0;
                     MemWrite <= 0;
                     Branch <= 0;
                     ALUop<= 2'b11;
                     end 
        8'b01100011: begin          //beq
                     ALUSrc <= 0;
                     MemtoReg <= 0; 
                     RegWrite <= 0;
                     MemRead <= 0;
                     MemWrite <= 0;
                     Branch <= 1;
                     ALUop<= 2'b01;
                     end 
        default: begin 
                 ALUSrc <= 0;
                 MemtoReg <= 0; 
                 RegWrite <= 0;
                 MemRead <= 0;
                 MemWrite <= 0;
                 Branch <= 0;
                 ALUop<= 2'b00;
                 end
    endcase
  end           

endmodule
