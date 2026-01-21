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
           input [1:0]w0_000,w0_001,w1_010,w1_011,w2_100,w2_101,w3_110,w3_111,
           input [1:0]w4_000,w4_001,w5_010,w5_011,w6_100,w6_101,w7_110,w7_111,
           output [2:0]s0_000,s0_001,s1_010,s1_011,s2_100,s2_101,s3_110,s3_111,
           output [2:0]s4_000,s4_001,s5_010,s5_011,s6_100,s6_101,s7_110,s7_111
    );
    
    wire [31:0]a;
    assign a[0]=dec_in[0]^w0_000[0];
    assign a[1]=dec_in[1]^w0_000[1];
    assign a[2]=dec_in[0]^w0_001[0];
    assign a[3]=dec_in[1]^w0_001[1];
    assign a[4]=dec_in[0]^w1_010[0];
    assign a[5]=dec_in[1]^w1_010[1];
    assign a[6]=dec_in[0]^w1_011[0];
    assign a[7]=dec_in[1]^w1_011[1];
    assign a[8]=dec_in[0]^w2_100[0];
    assign a[9]=dec_in[1]^w2_100[1];
    assign a[10]=dec_in[0]^w2_101[0];
    assign a[11]=dec_in[1]^w2_101[1];
    assign a[12]=dec_in[0]^w3_110[0];
    assign a[13]=dec_in[1]^w3_110[1];
    assign a[14]=dec_in[0]^w3_111[0];
    assign a[15]=dec_in[1]^w3_111[1];
    assign a[16]=dec_in[0]^w4_000[0];
    assign a[17]=dec_in[1]^w4_000[1];
    assign a[18]=dec_in[0]^w4_001[0];
    assign a[19]=dec_in[1]^w4_001[1];
    assign a[20]=dec_in[0]^w5_010[0];
    assign a[21]=dec_in[1]^w5_010[1];
    assign a[22]=dec_in[0]^w5_011[0];
    assign a[23]=dec_in[1]^w5_011[1];
    assign a[24]=dec_in[0]^w6_100[0];
    assign a[25]=dec_in[1]^w6_100[1];
    assign a[26]=dec_in[0]^w6_101[0];
    assign a[27]=dec_in[1]^w6_101[1];
    assign a[28]=dec_in[0]^w7_110[0];
    assign a[29]=dec_in[1]^w7_110[1];
    assign a[30]=dec_in[0]^w7_111[0];
    assign a[31]=dec_in[1]^w7_111[1];
    
    ha h0 (a[0],a[1],s0_000);
    ha h1 (a[2],a[3],s0_001);
    ha h2 (a[4],a[5],s1_010);
    ha h3 (a[6],a[7],s1_011);
    ha h4 (a[8],a[9],s2_100);
    ha h5 (a[10],a[11],s2_101);
    ha h6 (a[12],a[13],s3_110);
    ha h7 (a[14],a[15],s3_111);
    ha h8 (a[16],a[17],s4_000);
    ha h9 (a[18],a[19],s4_001);
    ha h10 (a[20],a[21],s5_010);
    ha h11 (a[22],a[23],s5_011);
    ha h12 (a[24],a[25],s6_100);
    ha h13 (a[26],a[27],s6_101);
    ha h14 (a[28],a[29],s7_110);
    ha h15 (a[30],a[31],s7_111);
endmodule
