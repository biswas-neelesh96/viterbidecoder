`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2025 18:59:56
// Design Name: 
// Module Name: smu
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


module smu(input [2:0]r000,r001,r010,r011,r100,r101,r110,r111,input clk,rst, output [2:0]out);
wire carry_8,carry_9,carry_10,carry_11;
wire [2:0] out1,out2,out3,out4,tout;
subtractor_3bit s0 (r000,r100,1'b0,carry_8);
subtractor_3bit s1 (r001,r101,1'b0,carry_9);
subtractor_3bit s2 (r010,r110,1'b0,carry_10);
subtractor_3bit s3 (r011,r111,1'b0,carry_11);

mux2to1_3bit m20 (3'b000,3'b100,carry_8,out1);
mux2to1_3bit m21 (3'b001,3'b101,carry_9,out2);
mux2to1_3bit m22 (3'b010,3'b110,carry_10,out3);
mux2to1_3bit m23 (3'b011,3'b111,carry_11,out4); 

mux8to1_3bit m40 (out1,out1,out2,out2,out3,out3,out4,out4,out,tout);
reg_3bit r0 (clk,rst,tout,out);
endmodule