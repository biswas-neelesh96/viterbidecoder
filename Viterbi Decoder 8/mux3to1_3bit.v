`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 15:29:53
// Design Name: 
// Module Name: mux3to1_2bit
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


module mux3to1_3bit (
    input  [2:0] in0,   // Input 0
    input  [2:0] in1,   // Input 1
    input  [2:0] in2,   // Input 2
    input  [2:0] sel,    // Select line (2 bits to select among 3 inputs)
    output reg [2:0] out // Output
);

    always @(*) begin
        case (sel)
            3'b00: out = in0;
            3'b01: out = in1;
            3'b10: out = in2;
            default: out = 3'b0;  // Default case for safety
        endcase
    end

endmodule
