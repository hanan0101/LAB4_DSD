`timescale 1ns / 1ps
module multiplier_8bit(
    input logic clk,
    input logic load,
    input logic RESET,
    input logic [7:0] A,
    input logic [7:0] B,
    output logic [15:0] result_add
);
    logic EN_count;
    logic en_r;
    logic [7:0] Aout, Bout;
    logic [15:0] product;
    logic [3:0] count;  // Changed to 4-bit counter    
    // Register for A
    register #(.n(8)) x_reg (
        .clk(clk),
        .rst_n(RESET),
        .en(load),
        .d(A),
        .q(Aout) 
    );
    // Register for B
    register #(.n(8)) y_reg (
        .clk(clk),
        .rst_n(RESET),
        .en(load),
        .d(B),
        .q(Bout) 
    );
    // Register for Result
    register #(.n(16)) result_reg (
        .clk(clk),
        .rst_n(RESET),
        .en(en_r),
        .d(product),
        .q(result_add) 
    );
    always_ff @(posedge clk or negedge RESET) begin
        if (!RESET) begin
            product <= 16'b0;
            count <= 4'b0;
            en_r <= 1'b0;
            EN_count <= 1'b0;
        end
        else if (load) begin
            product <= 16'b0;
            count <= 4'b0;
            en_r <= 1'b1;
            EN_count <= 1'b1;
        end
        else if (EN_count) begin
            if (count < Bout) begin
                product <= product + {8'b0, Aout};
                count <= count + 1;
                en_r <= 1'b1;
            end
            else begin
                EN_count <= 1'b0;
            end
        end
    end
      
endmodule