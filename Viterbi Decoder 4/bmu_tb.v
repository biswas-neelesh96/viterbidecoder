`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025
// Design Name: Viterbi Decoder
// Module Name: viterbi_decoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for viterbi_decoder
// 
// Dependencies: bmu, pmu, smu modules should be available
//////////////////////////////////////////////////////////////////////////////////

module bmu_tb;

//========================
// DUT Port Declarations
//========================
reg [1:0] dec_in;
reg [1:0] w0_00, w0_01, w1_10, w1_11;
reg [1:0] w2_00, w2_01, w3_10, w3_11;
wire [1:0]s0_00,s0_01,s1_10,s1_11,s2_00,s2_01,s3_10,s3_11;

//========================
// Instantiate the DUT
//========================
bmu uut (
    .dec_in(dec_in),
    .w0_00(w0_00), .w0_01(w0_01),
    .w1_10(w1_10), .w1_11(w1_11),
    .w2_00(w2_00), .w2_01(w2_01),
    .w3_10(w3_10), .w3_11(w3_11),
    .s0_00(s0_00),.s0_01(s0_01),
    .s1_10(s1_10),.s1_11(s1_11),
    .s2_00(s2_00),.s2_01(s2_01),
    .s3_10(s3_10),.s3_11(s3_11)
);

//========================
// Clock Generation
//========================

//========================
// Stimulus
//========================
initial begin
    // Initialize inputs
    dec_in = 2'b00;
    w0_00 = 2'b11; w0_01 = 2'b01;
    w1_10 = 2'b10; w1_11 = 2'b01;
    w2_00 = 2'b11; w2_01 = 2'b01;
    w3_10 = 2'b10; w3_11 = 2'b01;
    // Apply reset
   
    

    // Apply first input sequence
    #10;
    dec_in = 2'b01;

    // Apply next sequence
    #10;
    dec_in = 2'b10;
    #10;
    dec_in = 2'b11;

    // Another test case
    #10;
    dec_in = 2'b00;

    // Randomized test pattern
    #10;
    dec_in = 2'b01;
    #10;
    dec_in = 2'b10;
    #10;
    dec_in = 2'b11;
    #10;
    dec_in = 2'b00;
    #10;
    dec_in = 2'b01;
    #10;
    $finish;
end

//========================
// Monitoring
//========================

endmodule
