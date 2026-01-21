`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2025 11:02:06
// Design Name: 
// Module Name: subtractor_3bit
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


module subtractor_3bit(
    input  [2:0] A,
    input  [2:0] B,
    input Bin,
    output       Borrow
);

    wire [2:0] D;
    wire [3:0] B_comp;      // 2's complement of B
    wire [3:0] result;

    assign B_comp = {1'b0, (~B + 3'b001)};  // 2's complement of B
    assign result = {1'b0, A} + B_comp;      // 4-bit addition

    assign D = result[2:0];                  // lower 3 bits = difference
    assign Borrow = ~result[3];              // If MSB is 0 ? Borrow

endmodule
