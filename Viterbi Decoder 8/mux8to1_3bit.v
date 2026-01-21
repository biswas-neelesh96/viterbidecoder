`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2025 11:18:33
// Design Name: 
// Module Name: mux8to1_3bit
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


module mux8to1_3bit (
    input  [2:0] in0,   // Input 0
    input  [2:0] in1,   // Input 1
    input  [2:0] in2,   // Input 2
    input  [2:0] in3,   // Input 3
    input  [2:0] in4,   // Input 0
    input  [2:0] in5,   // Input 1
    input  [2:0] in6,   // Input 2
    input  [2:0] in7,   // Input 3
    input  [2:0]  sel,   // Select lines
    output reg [2:0] out // Output
);

    always @(*) begin
        case (sel)
            3'b000: out = in0;
            3'b001: out = in1;
            3'b010: out = in2;
            3'b011: out = in3;
            3'b100: out = in4;
            3'b101: out = in5;
            3'b110: out = in6;
            3'b111: out = in7;
            default: out = 3'b0;
        endcase
    end

endmodule
