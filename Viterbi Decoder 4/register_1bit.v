module register_1bit(
    input  wire clk,
    input  wire rst,    // asynchronous reset
    input  wire d,
    output reg  q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

endmodule
