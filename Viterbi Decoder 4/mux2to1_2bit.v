`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 15:27:33
// Design Name: 
// Module Name: mux2to1_2bit
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


module mux2to1_2bit(
    input [1:0] in0,      // 8-bit input 0
    input [1:0] in1,      // 8-bit input 1
    input sel,            // select line
    output [1:0] out      // 8-bit output
);

    assign out = (sel) ? in1 : in0;   // If sel=1, select in1; else select in0

endmodule