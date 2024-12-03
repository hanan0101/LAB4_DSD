`timescale 1ns / 1ps



module up_down#(parameter n=4)
(
input logic [n-1:0]down_count,
input logic [n-1:0]up_count,
input logic up_down,
output logic [n-1:0]count

    );
    
always @ (*)
begin 
 if (up_down==0)
         count=up_count;
 else 
         count=down_count;
    
   end  
   
endmodule
   