`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2025 11:15:54
// Design Name: 
// Module Name: reg_3bit
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


module reg_3bit (
    input  wire       clk,
    input  wire       rst,   // active high synchronous reset
    input  wire [2:0] d,       // 2-bit input
    output reg  [2:0] q        // 2-bit output
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 3'b000;      // reset value
    else
        q <= d;          // store new value
end

endmodule