`timescale 1ns / 1ps
module counter4bi(
  input logic clk,
  input logic reset,
  input logic en,
  input logic upDown,
  input logic load,
  input logic [3:0] d,
  output logic [3:0] q
);
  logic [3:0] count;
  logic [3:0] out;
  logic [3:0] down_count;
  logic [3:0] up_count;
  load_mux #(4) p_load(
    .load(load),
    .new_data(d),
    .count(down_count), // Connect count_updown.count to load_mux
    .out(out)
  );
  
// Apply equations from K-maps for down_count
assign down_count[0] = ~q[0];
assign down_count[1] = q[1] ^ q[0];
assign down_count[2] = q[2] ^ (q[1] & q[0]);
assign down_count[3] = q[3] ^ (q[2] & q[1] & q[0]);
// Apply equations from K-maps for up_count
assign d[0] = ~q[0];
assign d[1] = (~q[0]) ^ (q[1]);
assign d[2] = (q[2]) ^ (~q[1] & ~q[0]);
assign d[3] = (q[3]) ^ (~q[1] & ~q[0] & ~q[2]);  
  logic en_clk;
  assign en_clk = clk & en;
  
  flipflop ff1(
    .clk(en_clk),
    .reset(reset),
    .d(out[3]),
    .Q(q[3])
  );
  
  flipflop ff2(
    .clk(en_clk),
    .reset(reset),
    .d(out[2]),
    .Q(q[2])
  );
  
  flipflop ff3(
    .clk(en_clk),
    .reset(reset),
    .d(out[1]),
    .Q(q[1])
  );
  
  flipflop ff4(
    .clk(en_clk),
    .reset(reset),
    .d(out[0]),
    .Q(q[0])
  );
  
endmodule
