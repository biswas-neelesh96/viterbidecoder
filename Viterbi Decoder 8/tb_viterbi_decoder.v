`timescale 1ns/1ps

module tb_viterbi_decoder;

    // Inputs
    reg  [1:0] dec_in;
    reg  [1:0] w0_000,w0_001,w1_010,w1_011,w2_100,w2_101,w3_110,w3_111;
    reg  [1:0] w4_000,w4_001,w5_010,w5_011,w6_100,w6_101,w7_110,w7_111;
    reg clk, sel0, rst;
    reg [1:0] sel1;

    // Outputs
    wire [2:0] s0_000,s0_001,s1_010,s1_011,s2_100,s2_101,s3_110,s3_111;
    wire [2:0] s4_000,s4_001,s5_010,s5_011,s6_100,s6_101,s7_110,s7_111;
    wire [2:0] r000,r001,r010,r011,r100,r101,r110,r111;
    wire [2:0] out;

    // DUT
    viterbi_decoder uut (
        dec_in,
        w0_000,w0_001,w1_010,w1_011,w2_100,w2_101,w3_110,w3_111,
        w4_000,w4_001,w5_010,w5_011,w6_100,w6_101,w7_110,w7_111,
        clk, sel0, rst, sel1,
        s0_000,s0_001,s1_010,s1_011,s2_100,s2_101,s3_110,s3_111,
        s4_000,s4_001,s5_010,s5_011,s6_100,s6_101,s7_110,s7_111,
        r000,r001,r010,r011,r100,r101,r110,r111,
        out
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 100 MHz clock
    end

    // Stimulus
    initial begin
        $dumpfile("viterbi_tb.vcd");
        $dumpvars(0, tb_viterbi_decoder);

        // Initialize Inputs
        dec_in = 0;
        sel0 = 0;
        sel1 = 0;
        rst  = 1;

        // Initialize dummy weights (branch metrics)
        w0_000=1; w0_001=2; w1_010=1; w1_011=3;
        w2_100=2; w2_101=1; w3_110=3; w3_111=2;

        w4_000=1; w4_001=2; w5_010=3; w5_011=1;
        w6_100=2; w6_101=3; w7_110=1; w7_111=2;

        // Apply reset
        #20 rst = 0;

        // Test different decoder inputs
        #10 dec_in = 2'b00;
        sel1 = 2'b00;
        sel0 = 0;

        #20 dec_in = 2'b01;
        sel1 = 2'b01;

        #20 dec_in = 2'b10;
        sel1 = 2'b10;
        sel0 = 1;

        #20 rst=1; dec_in = 2'b11;
        sel0=0; sel1 = 2'b00;
        w0_000=3; w0_001=1; w1_010=3; w1_011=2;
        w2_100=1; w2_101=3; w3_110=2; w3_111=3;

        w4_000=2; w4_001=3; w5_010=1; w5_011=2;
        w6_100=3; w6_101=1; w7_110=2; w7_111=3;
        #10; dec_in = 2'b10; rst=0;
        #10; dec_in = 2'b01;
        #20; dec_in = 2'b00; sel1=2'b01;
        #20; sel0=1; sel1=2'b10;
        #20;
        $display("Test completed.");
        $finish;
    end

endmodule
