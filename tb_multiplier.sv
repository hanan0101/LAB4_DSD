`timescale 1ns / 1ps
module tb_multiplier_8bit();
    logic clk;
    logic load;
    logic RESET;
    logic [7:0] A, B;
    logic [15:0] result_add;
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end  
    multiplier_8bit DUT (.*);
    
    // Test stimulus
    initial begin
        RESET =1;
        #10;
        // Initialize
        RESET = 0;
        load = 0;
        A = 0;
        B = 0;
        
        // Release reset
        #20 RESET = 1;
        #10;
        
        // Test Case 1: 3 x 2 = 6
        A = 8'b0000_0011;
        B = 8'b0000_0010;
        load = 1;
        #10;load =0;
        #100;  // Longer wait
        
        // Test Case 2: 2x 5 = 20
        A = 8'b0000_0010;
        B = 8'b0000_0101;
        load = 1;
        #10;load =0;
        #100;  // Longer wait
    
        // Test Case 3: 7 x 3 = 21
        A = 8'b0000_0011;
        B = 8'b0000_0111;
         load = 1;
        #10;load =0;
        #100;  // Longer wait        
        
        $finish;
    end
    
    // Monitor results
    initial begin
        $monitor("Time=%0t Reset=%b Load=%b A=%0d B=%0d Result=%0d", 
                 $time, RESET, load, A, B, result_add);
    end

endmodule