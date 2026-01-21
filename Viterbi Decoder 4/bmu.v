`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 15:32:00
// Design Name: 
// Module Name: bmu
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


module bmu(input [1:0]dec_in, 
           input [1:0]w0_00,w0_01,w1_10,w1_11,w2_00,w2_01,w3_10,w3_11,
           output [1:0]s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11
    );
    
    wire [15:0]a;
    assign a[0]=dec_in[0]^w0_00[0];
    assign a[1]=dec_in[1]^w0_00[1];
    assign a[2]=dec_in[0]^w0_01[0];
    assign a[3]=dec_in[1]^w0_01[1];
    assign a[4]=dec_in[0]^w1_10[0];
    assign a[5]=dec_in[1]^w1_10[1];
    assign a[6]=dec_in[0]^w1_11[0];
    assign a[7]=dec_in[1]^w1_11[1];
    assign a[8]=dec_in[0]^w2_00[0];
    assign a[9]=dec_in[1]^w2_00[1];
    assign a[10]=dec_in[0]^w2_01[0];
    assign a[11]=dec_in[1]^w2_01[1];
    assign a[12]=dec_in[0]^w3_10[0];
    assign a[13]=dec_in[1]^w3_10[1];
    assign a[14]=dec_in[0]^w3_11[0];
    assign a[15]=dec_in[1]^w3_11[1];
    
    ha h0 (a[0],a[1],s0_00);
    ha h1 (a[2],a[3],s0_01);
    ha h2 (a[4],a[5],s1_10);
    ha h3 (a[6],a[7],s1_11);
    ha h4 (a[8],a[9],s2_00);
    ha h5 (a[10],a[11],s2_01);
    ha h6 (a[12],a[13],s3_10);
    ha h7 (a[14],a[15],s3_11);
endmodule
