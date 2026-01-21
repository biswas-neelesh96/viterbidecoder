`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 15:25:59
// Design Name: 
// Module Name: rca_2bit
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


module rca_2bit(input [1:0]x,y, input cin, output [1:0]s);
wire c0,cout;
fa f0 (x[0],y[0],cin,s[0],c0);
fa f1 (x[1],y[1],c0,s[1],cout);
endmodule