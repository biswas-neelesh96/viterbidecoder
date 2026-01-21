`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 15:30:36
// Design Name: 
// Module Name: mux4to1_2bit
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


module mux4to1_2bit (
    input  [1:0] in0,   // Input 0
    input  [1:0] in1,   // Input 1
    input  [1:0] in2,   // Input 2
    input  [1:0] in3,   // Input 3
    input  [1:0]  sel,   // Select lines
    output reg [1:0] out // Output
);

    always @(*) begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 2'b0;
        endcase
    end

endmodule
