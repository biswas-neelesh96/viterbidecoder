`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 18:11:52
// Design Name: 
// Module Name: pmu
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


module pmu(input [2:0]s0_000,s0_001,s1_010,s1_011,s2_100,s2_101,s3_110,s3_111,
           input [2:0]s4_000,s4_001,s5_010,s5_011,s6_100,s6_101,s7_110,s7_111,
           input clk,sel0,rst, input [1:0]sel1, 
           output reg [2:0]r000,r001,r010,r011,r100,r101,r110,r111
           );
           
reg [2:0]init000,init001,init010,init011,init100,init101,init110,init111;
wire [2:0]r000_temp,r001_temp,r010_temp,r011_temp,r100_temp,r101_temp,r110_temp,r111_temp;
wire [2:0]x0,y0,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7;
wire [2:0]rx0_00,rx1_00,rx2_00,rx3_00,rx4_00,rx5_00,rx6_00,rx7_00;
wire [2:0]dx0_00,dx1_00,dx2_00,dx3_00,dx4_00,dx5_00,dx6_00,dx7_00;
wire carry_0,carry_1,carry_2,carry_3,carry_4,carry_5,carry_6,carry_7;

rca_3bit rc0 (s0_000,r000,1'b0,x0);
rca_3bit rc1 (s0_001,r001,1'b0,y0);
rca_3bit rc2 (s1_010,r010,1'b0,x1);
rca_3bit rc3 (s1_011,r011,1'b0,y1);
rca_3bit rc4 (s2_100,r100,1'b0,x2);
rca_3bit rc5 (s2_101,r101,1'b0,y2);
rca_3bit rc6 (s3_110,r110,1'b0,x3);
rca_3bit rc7 (s3_111,r111,1'b0,y3);
rca_3bit rc8 (s4_000,r000,1'b0,x4);
rca_3bit rc9 (s4_001,r001,1'b0,y4);
rca_3bit rc10 (s5_010,r010,1'b0,x5);
rca_3bit rc11 (s5_011,r011,1'b0,y5);
rca_3bit rc12 (s6_100,r100,1'b0,x6);
rca_3bit rc13 (s6_101,r101,1'b0,y6);
rca_3bit rc14 (s7_110,r110,1'b0,x7);
rca_3bit rc15 (s7_111,r111,1'b0,y7);

subtractor_3bit s0 (x0,y0,1'b0,carry_0);
subtractor_3bit s1 (x1,y1,1'b0,carry_1);
subtractor_3bit s2 (x2,y2,1'b0,carry_2);
subtractor_3bit s3 (x3,y3,1'b0,carry_3);
subtractor_3bit s4 (x4,y4,1'b0,carry_4);
subtractor_3bit s5 (x5,y5,1'b0,carry_5);
subtractor_3bit s6 (x6,y6,1'b0,carry_6);
subtractor_3bit s7 (x7,y7,1'b0,carry_7);

mux2to1_3bit m000 (x0,y0,carry_0,rx0_00);
mux2to1_3bit m001 (x1,y1,carry_1,rx1_00);
mux2to1_3bit m010 (x2,y2,carry_2,rx2_00);
mux2to1_3bit m011 (x3,y3,carry_3,rx3_00);
mux2to1_3bit m100 (x4,y4,carry_4,rx4_00);
mux2to1_3bit m101 (x5,y5,carry_5,rx5_00);
mux2to1_3bit m110 (x6,y6,carry_6,rx6_00);
mux2to1_3bit m111 (x7,y7,carry_7,rx7_00);

mux2to1_3bit m2_0 (x0,rx0_00,sel0,dx0_00);
mux3to1_3bit m3_0 (3'b0,x1,rx1_00,sel1,dx1_00);
mux3to1_3bit m3_1 (3'b0,x2,rx2_00,sel1,dx2_00);
mux3to1_3bit m3_2 (3'b0,x3,rx3_00,sel1,dx3_00);
mux2to1_3bit m2_1 (x4,rx4_00,sel0,dx4_00);
mux3to1_3bit m3_3 (3'b0,x5,rx5_00,sel1,dx5_00);
mux3to1_3bit m3_4 (3'b0,x6,rx6_00,sel1,dx6_00);
mux3to1_3bit m3_5 (3'b0,x7,rx7_00,sel1,dx7_00);

reg_3bit rg0 (clk,rst,dx0_00,r000_temp);
reg_3bit rg1 (clk,rst,dx1_00,r001_temp);
reg_3bit rg2 (clk,rst,dx2_00,r010_temp);
reg_3bit rg3 (clk,rst,dx3_00,r011_temp);
reg_3bit rg4 (clk,rst,dx4_00,r100_temp);
reg_3bit rg5 (clk,rst,dx5_00,r101_temp);
reg_3bit rg6 (clk,rst,dx6_00,r110_temp);
reg_3bit rg7 (clk,rst,dx7_00,r111_temp);

always @(posedge clk or posedge rst) begin
    if (rst)
        init000 <= 3'b000;           // reset feedback
    else
        init000 <= r000_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r000 <= 3'b000;
    else
        r000 <= r000_temp;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        init001 <= 3'b000;           // reset feedback
    else
        init001 <= r001_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r001 <= 3'b000;
    else
        r001 <= r001_temp;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        init010 <= 3'b000;           // reset feedback
    else
        init010 <= r010_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r010 <= 3'b000;
    else
        r010 <= r010_temp;
end
always @(posedge clk or posedge rst) begin
    if (rst)
        init011 <= 3'b000;           // reset feedback
    else
        init011 <= r011_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r011 <= 3'b000;
    else
        r011 <= r011_temp;
end
//
always @(posedge clk or posedge rst) begin
    if (rst)
        init100 <= 3'b000;           // reset feedback
    else
        init100 <= r100_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r100 <= 3'b000;
    else
        r100 <= r100_temp;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        init101 <= 3'b000;           // reset feedback
    else
        init101 <= r101_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r101 <= 3'b000;
    else
        r101 <= r101_temp;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        init110 <= 3'b000;           // reset feedback
    else
        init110 <= r010_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r110 <= 3'b000;
    else
        r110 <= r110_temp;
end
always @(posedge clk or posedge rst) begin
    if (rst)
        init111 <= 3'b000;           // reset feedback
    else
        init111 <= r111_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r111 <= 3'b000;
    else
        r111 <= r111_temp;
end
endmodule


