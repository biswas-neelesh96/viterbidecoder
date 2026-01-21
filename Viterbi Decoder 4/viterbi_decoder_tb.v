`timescale 1ns / 1ps

module viterbi_decoder_tb();

    // Inputs
    reg [1:0] dec_in;
    reg [1:0] w0_00, w0_01, w1_10, w1_11, w2_00, w2_01, w3_10, w3_11;
    reg clk, sel0, rst;
    reg [1:0] sel1;
    
    // Outputs
    wire [1:0] s0_00, s0_01, s1_10, s1_11, s2_00, s2_01, s3_10, s3_11;
    wire [1:0] r00, r01, r10, r11;
    wire [1:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    viterbi_decoder uut (
        .dec_in(dec_in),
        .w0_00(w0_00), .w0_01(w0_01),
        .w1_10(w1_10), .w1_11(w1_11),
        .w2_00(w2_00), .w2_01(w2_01),
        .w3_10(w3_10), .w3_11(w3_11),
        .clk(clk), .sel0(sel0), .rst(rst), .sel1(sel1),
        .s0_00(s0_00), .s0_01(s0_01),
        .s1_10(s1_10), .s1_11(s1_11),
        .s2_00(s2_00), .s2_01(s2_01),
        .s3_10(s3_10), .s3_11(s3_11),
        .r00(r00), .r01(r01), .r10(r10), .r11(r11),
        .out(out)
    );
    
    // Clock generation
    always #5 clk = ~clk;  // 100MHz clock (10ns period)
    
    // Test sequence storage
    initial begin
        
        
        clk = 0;
        rst = 1;
        sel0 = 0;
        sel1 = 2'b00;
        dec_in = 2'b11;
        
        // Initialize weights (example values - adjust based on your specific code)
        w0_00 = 2'b00; w0_01 = 2'b11;
        w1_10 = 2'b11; w1_11 = 2'b00;
        w2_00 = 2'b10; w2_01 = 2'b01;
        w3_10 = 2'b01; w3_11 = 2'b10;
        
        // Apply reset
        #10;
        rst = 0;dec_in=01;
        #10; dec_in=10; sel1=01;
        #10; dec_in=01;
        #10; dec_in=10; sel0=1; sel1=10;
        #20; dec_in=11;    
        #10; $finish;
        
    end
    // Monitor important signals
    
    // VCD file generation for waveform viewing
    
endmodule