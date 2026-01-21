`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for: pmu
// Engineer: ChatGPT
// Description: Testbench to verify functionality of pmu module
//////////////////////////////////////////////////////////////////////////////////

module pmu_tb;

    // Inputs
    reg [1:0] s0_00, s0_01, s1_10, s1_11;
    reg [1:0] s2_00, s2_01, s3_10, s3_11;
    reg clk, sel0, rst;
    reg [1:0] sel1;

    // Outputs
    wire [1:0] r00, r01, r10, r11;

    // Instantiate DUT
    pmu uut (
        .s0_00(s0_00), .s0_01(s0_01), .s1_10(s1_10), .s1_11(s1_11),
        .s2_00(s2_00), .s2_01(s2_01), .s3_10(s3_10), .s3_11(s3_11),
        .clk(clk), .sel0(sel0), .rst(rst), .sel1(sel1),
        .r00(r00), .r01(r01), .r10(r10), .r11(r11)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize
        rst = 1;
        sel0 = 0;
        sel1 = 2'b00;
        s0_00 = 2'b00; s0_01 = 2'b00;
        s1_10 = 2'b00; s1_11 = 2'b00;
        s2_00 = 2'b00; s2_01 = 2'b00;
        s3_10 = 2'b00; s3_11 = 2'b00;

        // Display header
        $display("Time\tclk\trst\tsel0\tsel1\ts0_00 s0_01 s1_10 s1_11 s2_00 s2_01 s3_10 s3_11 || r00 r01 r10 r11");
        $monitor("%0dns\t%b\t%b\t%b\t%02b\t%02b %02b %02b %02b %02b %02b %02b %02b || %02b %02b %02b %02b", 
                 $time, clk, rst, sel0, sel1,
                 s0_00, s0_01, s1_10, s1_11, s2_00, s2_01, s3_10, s3_11,
                 r00, r01, r10, r11);

        // Apply reset
        #10 rst = 0;

        // Test Case 1
        #10;
        s0_00 = 2'b01; s0_01 = 2'b10;
        s1_10 = 2'b11; s1_11 = 2'b00;
        s2_00 = 2'b01; s2_01 = 2'b11;
        s3_10 = 2'b10; s3_11 = 2'b01;
        sel0 = 0; sel1 = 2'b01;

        // Test Case 2
        #20;
        sel0 = 1; sel1 = 2'b10;

        // Test Case 3
        //#20;
       // sel0 = 0; sel1 = 2'b00;

        // Test Case 4
        #20;
        s0_00 = 2'b11; s0_01 = 2'b01;
        s1_10 = 2'b10; s1_11 = 2'b11;
        s2_00 = 2'b00; s2_01 = 2'b01;
        s3_10 = 2'b10; s3_11 = 2'b00;
        #20;

        $finish;
    end

endmodule
