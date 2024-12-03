`timescale 1ns / 1ps
 module tb_counter;
    // Parameters
   parameter n = 8;
    // Inputs
    logic clk;
    logic resetn;
    logic load;
    logic en;
    logic up_down;
    logic [3:0] d;
    // Outputs
    logic [3:0] count; 



 counter_nbit #(n) dut(.clk(clk),.resetn(resetn), .en(en), .up_down(up_down), .load(load), .d(d),.count(count));

   // counter_4bit counter (.clk(clk),.resetn(resetn), .en(en), .up_down(up_down), .load(load), .d(d),.count(count));

   
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end
    initial begin
       // Initialize inputs
    resetn = 0;
    load = 0;
    en = 0;
    up_down = 0;
    d = 4'b0000;
    // Apply reset
    #10 resetn = 1; // Release reset
    // Load some values and enable counting
    #10 d = 4'b1000; // Load value 8
    load = 1;
    #10; // Wait for one clock cycle
    load = 0; // Deactivate load
    // Enable counting up
    en = 1;
    up_down = 0; // Count up
    #200; // Allow some time for counting up
    // Enable counting down
    up_down = 1; // Count down
    #100; // Allow some time for counting down
    // Disable counting
    en = 0;
    #10 resetn = 0;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | resetn: %b | load: %b | en: %b | up_down: %b | d: %b | count: %b", 
                 $time, resetn, load, en, up_down, d, count);
    end
endmodule 