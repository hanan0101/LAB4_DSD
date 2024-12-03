`timescale 1ns / 1ps



module counter_nbit #(
    parameter n = 4
)(

    input  logic  clk,
    input  logic resetn,
    input  logic load,
    input  logic en,
    input  logic up_down,
    input  logic [n - 1: 0] d,
    output logic  [n - 1: 0] count
);

always @(posedge clk or negedge resetn) begin 
    if (~resetn) 
        count <= 0; // Reset count to 0 on active-low reset
    else begin 
        if (load) //if load high load data if low counting
            count <= d; // Load value d into count
        else if (en) begin 
            if (up_down == 0) //if low up counting
                count <= count + 1; // Count up
            else 
                count <= count - 1; // Count down
        end
    end
end

endmodule : counter_nbit

