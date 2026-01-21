`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2025 10:48:30
// Design Name: 
// Module Name: rca_3bit
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


module rca_3bit(input [2:0]x,y, input cin, output [2:0]s);
wire c0,c1,cout;
fa f0 (x[0],y[0],cin,s[0],c0);
fa f1 (x[1],y[1],c0,s[1],c1);
fa f2 (x[2],y[2],c1,s[2],cout);
endmodule
