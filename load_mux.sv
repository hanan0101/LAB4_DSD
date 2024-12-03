`timescale 1ns / 1ps

module load_mux #(parameter n=4 )(

input logic [n-1:0]new_data,
input logic [n-1:0]count,
input logic load,
output logic [n-1:0]out

    );
    
always @ (*)
begin 
 if (load==1)
         out=new_data;
 else 
         out=new_data;
    
   end  
   
endmodule
