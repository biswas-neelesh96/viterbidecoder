`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 10:05:46
// Design Name: 
// Module Name: encoder
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


module conv_encoder(input x, input clk,rst, output reg [1:0]y);
wire tout1,tout2;
register_1bit r0 (clk,rst,x,tout1);
register_1bit r1 (clk,rst,tout1,tout2);
always @(posedge clk or posedge rst)
    begin
    if (rst)
        y[1] <= 1'b0;
    else 
        y[1] <= x^tout1^tout2;
    end
always @(posedge clk or posedge rst)
    begin
    if(rst)
        y[0] <= 1'b0;
    else
        y[0] <= x^tout2;
    end
endmodule
