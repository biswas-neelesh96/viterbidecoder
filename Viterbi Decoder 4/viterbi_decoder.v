`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 16:30:21
// Design Name: 
// Module Name: viterbi_decoder
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


module viterbi_decoder(input [1:0]dec_in,w0_00,w0_01,w1_10,w1_11,w2_00,w2_01,w3_10,w3_11,
                       input clk,sel0,rst,
                       input [1:0]sel1, output [1:0]s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11,
                       output [1:0]r00,r01,r10,r11,
                       output [1:0]out);
//wire [1:0]s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11;
//wire [1:0]r00,r01,r10,r11;
bmu b0 (dec_in,w0_00,w0_01,w1_10,w1_11,w2_00,w2_01,w3_10,w3_11,s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11);
pmu p0 (s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11,clk,sel0,rst,sel1,r00,r01,r10,r11);
smu s0 (r00,r01,r10,r11,clk,rst,out);

endmodule
