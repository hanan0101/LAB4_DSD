`timescale 1ns / 1ps


module register_dataflow  #(
    parameter n = 4 // Width of the register
)(
    input logic [n-1:0] d,    // 4-bit input data
    input logic clk,        // Clock signal
    input logic rst_n,      // Asynchronous active-low reset
    input logic en, 
    output logic [n-1:0] q    // 4-bit output
);
 logic en_clk;
 assign en_clk = clk & en;
flipflop ff1(
    .clk(en_clk),
    .reset(rst_n),
    .d(d[3]),
    .Q(q[3])
);
flipflop ff2(
    .clk(en_clk),
    .reset(rst_n),
    .d(d[2]),
    .Q(q[2])
);
flipflop ff3(
    .clk(en_clk),
    .reset(rst_n),
    .d(d[1]),
    .Q(q[1])
);
flipflop ff4(
    .clk(en_clk),
    .reset(rst_n),
    .d(d[0]),
    .Q(q[0])
);
endmodule
