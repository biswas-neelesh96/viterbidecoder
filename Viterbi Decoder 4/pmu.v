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


module pmu(input [1:0]s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11,
           input clk,sel0,rst, input [1:0]sel1, 
           output reg [1:0]r00,r01,r10,r11
           );
           
reg [1:0]init00,init01,init10,init11;
wire [1:0]r00_temp,r01_temp,r10_temp,r11_temp;
wire [1:0]x0,y0,x1,y1,x2,y2,x3,y3;
wire [1:0]rx0_00,rx1_00,rx2_00,rx3_00,dx0_00,dx1_00,dx2_00,dx3_00;
wire carry_0,carry_1,carry_2,carry_3;
rca_2bit rc0 (s0_00,r00,1'b0,x0);
rca_2bit rc1 (s0_01,r01,1'b0,y0);
rca_2bit rc2 (s1_10,r10,1'b0,x1);
rca_2bit rc3 (s1_11,r11,1'b0,y1);
rca_2bit rc4 (s2_00,r00,1'b0,x2);
rca_2bit rc5 (s2_01,r01,1'b0,y2);
rca_2bit rc6 (s3_10,r10,1'b0,x3);
rca_2bit rc7 (s3_11,r11,1'b0,y3);

subtractor_2bit s0 (x0,y0,1'b0,carry_0);
subtractor_2bit s1 (x1,y1,1'b0,carry_1);
subtractor_2bit s2 (x2,y2,1'b0,carry_2);
subtractor_2bit s3 (x3,y3,1'b0,carry_3);

mux2to1_2bit m00 (x0,y0,carry_0,rx0_00);
mux2to1_2bit m01 (x1,y1,carry_1,rx1_00);
mux2to1_2bit m10 (x2,y2,carry_2,rx2_00);
mux2to1_2bit m11 (x3,y3,carry_3,rx3_00);

mux2to1_2bit m2_0 (x0,rx0_00,sel0,dx0_00);
mux3to1_2bit m3_0 (2'b00,x1,rx1_00,sel1,dx1_00);
mux2to1_2bit m2_1 (x2,rx2_00,sel0,dx2_00);
mux3to1_2bit m3_1 (2'b00,x3,rx3_00,sel1,dx3_00);

reg_2bit rg0 (clk,rst,dx0_00,r00_temp);
reg_2bit rg1 (clk,rst,dx1_00,r01_temp);
reg_2bit rg2 (clk,rst,dx2_00,r10_temp);
reg_2bit rg3 (clk,rst,dx3_00,r11_temp);

always @(posedge clk or posedge rst) begin
    if (rst)
        init00 <= 2'b00;           // reset feedback
    else
        init00 <= r00_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r00 <= 2'b00;
    else
        r00 <= r00_temp;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        init01 <= 2'b00;           // reset feedback
    else
        init01 <= r01_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r01 <= 2'b00;
    else
        r01 <= r01_temp;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        init10 <= 2'b00;           // reset feedback
    else
        init10 <= r10_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r10 <= 2'b00;
    else
        r10 <= r10_temp;
end
always @(posedge clk or posedge rst) begin
    if (rst)
        init11 <= 2'b00;           // reset feedback
    else
        init11 <= r11_temp;   // feed back lower 2 bits
end

// Output assignment
always @(posedge clk or posedge rst) begin
    if (rst)
        r11 <= 2'b00;
    else
        r11 <= r11_temp;
end
endmodule
