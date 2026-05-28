// Code your design here
// Code your design here

module single_portRAM(clk,we,rst,data_in,data_out,addr);
  
  input clk,rst,we;
  input [2:0]addr;
  input [7:0]data_in;
  output reg [7:0]data_out;
  reg [7:0]mem[7:0];
  
  always@(posedge clk or posedge rst)
    begin 
      
      if(rst)
        begin 
        data_out<=0;
        mem[addr]<=0;
        end 
      else if(we)
        mem[addr]<=data_in;
      else 
        data_out<=mem[addr];
    end 
  
endmodule 

