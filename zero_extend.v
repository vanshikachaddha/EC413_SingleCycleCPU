`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 11:53:21 PM
// Design Name: 
// Module Name: zero_extend
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


module zero_extend (
    input [15:0] in,
    output [31:0] zero_out
);

    assign zero_out = {16'b0, in};

endmodule