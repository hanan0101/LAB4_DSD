`timescale 1ns / 1ps


module tb_flipflop;
    
    logic clk;
    logic reset;
    logic d;
    logic Q;
    logic Qbar;
    

    // Instantiate the flipflop module
    flipflop uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qbar(Qbar)
        
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
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

