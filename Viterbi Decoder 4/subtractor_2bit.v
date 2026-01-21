`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 15:26:45
// Design Name: 
// Module Name: subtractor_2bit
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


module subtractor_2bit (
    input [1:0] A,      // Minuend
    input [1:0] B,      // Subtrahend
    input Bin,          // Borrow in
      // Difference output
    output Bout          // Borrow out
);
    wire [1:0] Diff;
    wire b1,Bout1; // internal borrow

    // 1st bit subtraction
    assign Diff[0] = A[0] ^ B[0] ^ Bin;
    assign b1      = (~A[0] & B[0]) | (B[0] & Bin) | (~A[0] & Bin);

    // 2nd bit subtraction
    assign Diff[1] = A[1] ^ B[1] ^ b1;
    assign Bout1    = (~A[1] & B[1]) | (B[1] & b1) | (~A[1] & b1);
    not n0(Bout,Bout1);
endmodule