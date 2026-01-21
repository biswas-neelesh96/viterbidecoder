`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 11:09:13
// Design Name: 
// Module Name: encoder_decoder
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


module encoder_decoder(input x,clk,rst,sel0, 
                       input [1:0]dec_in,sel1,
                       input [1:0]w0_00,w0_01,w1_10,w1_11,w2_00,w2_01,w3_10,w3_11, 
                       output [1:0]s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11,
                       output [1:0]r00,r01,r10,r11,
                       output [1:0]out);
wire [1:0]y;                      
conv_encoder c0 (x,clk,rst,y);
viterbi_decoder v0 (y,w0_00,w0_01,w1_10,w1_11,w2_00,w2_01,w3_10,w3_11,clk,sel0,rst,sel1,
                    s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11,r00,r01,r10,r11,out);                      
endmodule
