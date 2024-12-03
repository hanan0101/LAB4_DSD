`timescale 1ns / 1ps

module counter_4bit(
//input logic [3:0]d,
input logic rest,clk,
input logic s,
input logic en,
output logic [3:0]q

    
    );
 // logic s;
  logic [3:0]a;
  logic [3:0]out;
  
    mux #(4) m0(.s(s),.x(d),.y(a),.z(out));
  
    logic [3:0]d;  
    assign d[0]=~q[0];
    assign d[1]=q[0]^q[1];
    assign d[2]=(q[2]&~q[0])|(q[2]&~q[1])|(~q[2]&q[1]&q[0]);
    assign d[3]=(q[3]&~q[2])|(q[3]&~q[0])|(~q[1]&q[3])|(~q[3]&q[2]&q[1]&q[0]);
    
    /* assign a[0]=~q[0];
     assign a[1]=(~q[1]&~q[0])|(q[1]&q[0]);
     assign a[2]=(q[2])&(q[1]|(q[3]&q[0]))|(~q[2]&~q[1]&~q[0]);
     assign a[3]=(q[3])&(q[0]|q[1]|q[2])|(~q[3]&~q[1]&~q[0]&~q[2]);*/
 
     assign a[0]=~q[0];
     assign a[1]=(~q[0])^(q[1]);
     assign a[2]=(q[2])^(~q[1]&~q[0]);
     assign a[3]=(q[3])^(~q[1]&~q[0]&~q[2]);
    
    
    
      logic en_clk;
      assign en_clk = clk & en;
  
  
 flipflop ff1(
    .clk(en_clk),
    .reset(rest),
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