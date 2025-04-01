`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 11:40:30 PM
// Design Name: 
// Module Name: three_input_mux
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

// this module selects the immediate that we need to use based on our instruction (ADDI, ORI, or LUI) 
module three_input_mux(
    input [2:0] select,     // connected to Op Code 
    input [31:0] sign_imm,
    input [31:0] zero_imm,
    input [31:0] left_imm,
    output reg [31:0] imm

    );
    
    always @(*) begin
        case(select)
            3'b011: imm = sign_imm;
            3'b100: imm = zero_imm;
            3'b101: imm = left_imm;
            default: imm = sign_imm;
        endcase
    end 
endmodule
