`timescale 1ns / 1ps

module td_D_latch_tb;
    logic clk;
    logic reset;
    logic d;
    logic Q;
    logic Qbar;

    // Instantiate the D_latch module
    D_latch d_reset (
        .d(d),
        .Reset(reset),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation - changes every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize
        reset = 0;
        d = 1'b0; 
        #10;
        
        reset = 1;
        d = 1'b1; 
        #10; 
        
        reset = 1;
        d = 1'b0; 
        #10; 
        
        reset = 1;
        d = 1'b1; 
        #5; 
        
        reset = 0;
        d = 1'b1; 
        #10; 
        
        reset = 1;
        d = 1'b1; 
        #10;
        
        $finish;  // End simulation
    end 
endmodule