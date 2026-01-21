module reg_2bit (
    input  wire       clk,
    input  wire       rst,   // active high synchronous reset
    input  wire [1:0] d,       // 2-bit input
    output reg  [1:0] q        // 2-bit output
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 2'b00;      // reset value
    else
        q <= d;          // store new value
end

endmodule
