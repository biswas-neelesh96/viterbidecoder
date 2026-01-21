`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 16:37:56
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


module smu(input [1:0]r00,r01,r10,r11,input clk,rst, output [1:0]out);
wire carry_4,carry_5;
wire [1:0] out1,out2,tout;
subtractor_2bit s0 (r00,r10,1'b0,carry_4);
subtractor_2bit s1 (r01,r11,1'b0,carry_5);

mux2to1_2bit m20 (2'b00,2'b10,carry_4,out1);
mux2to1_2bit m21 (2'b01,2'b11,carry_5,out2);
 
mux4to1_2bit m40 (out1,out1,out2,out2,out,tout);
reg_2bit r0 (clk,rst,tout,out);
endmodule
