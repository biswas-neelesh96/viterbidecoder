`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025
// Design Name: SMU Testbench
// Module Name: smu_tb
// Project Name: Viterbi Decoder
// Target Devices: 
// Tool Versions: 
// Description: Testbench for SMU module
//
//////////////////////////////////////////////////////////////////////////////////

module smu_tb;

// Inputs
reg [1:0] r00, r01, r10, r11;
reg clk;

// Output
wire [1:0] out;

// Instantiate the Unit Under Test (UUT)
smu uut (
    .r00(r00),
    .r01(r01),
    .r10(r10),
    .r11(r11),
    .clk(clk),
    .out(out)
);

// Clock generation
initial begin
    clk = 1;
    forever #5 clk = ~clk; // 10ns clock period
end

// Stimulus
initial begin
    // Initialize inputs
    r00 = 2'b00; r01 = 2'b00;
    r10 = 2'b00; r11 = 2'b00;

    // Wait for global reset
    #10;

    // Apply test vectors
    r00 = 2'b01; r01 = 2'b10; r10 = 2'b00; r11 = 2'b01;
    #20;

    r00 = 2'b10; r01 = 2'b11; r10 = 2'b01; r11 = 2'b10;
    #20;

    r00 = 2'b11; r01 = 2'b01; r10 = 2'b10; r11 = 2'b00;
    #20;

    r00 = 2'b00; r01 = 2'b11; r10 = 2'b10; r11 = 2'b01;
    #20;
    
    r00 = 2'b00; r01 = 2'b01; r10 = 2'b10; r11 = 2'b11;
    #20;

    r00 = 2'b00; r01 = 2'b10; r10 = 2'b01; r11 = 2'b11;
    #20;
    
    r00 = 2'b00; r01 = 2'b11; r10 = 2'b10; r11 = 2'b01;
    #20;
    
    r00 = 2'b11; r01 = 2'b00; r10 = 2'b10; r11 = 2'b01;
    #20;
    // Hold last values for a while

    // End simulation
    $stop;
end

// Monitor outputs
initial begin
    $monitor("Time=%0t | r00=%b r01=%b r10=%b r11=%b | out=%b", 
              $time, r00, r01, r10, r11, out);
end

endmodule
