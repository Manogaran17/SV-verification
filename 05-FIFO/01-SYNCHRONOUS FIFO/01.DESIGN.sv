// Code your design here

module FIFO_syn(data_in,data_out,clk,rst,full,empty,we,re);
  
  input clk,rst,we,re;
 
  output full,empty;
  input [7:0]data_in;
  output reg[7:0]data_out;
  
  reg[7:0]mem[0:7];  // MEMORY
  
  reg [3:0]wrpt,rdpt; // POINTER
  
  always@(posedge clk or posedge rst)
    
    begin
      
      if(rst)
        begin
        wrpt<=0;
        rdpt<=0;
        data_out<=0;
        end
      
      else
        begin
       if(we&&!full) 
        begin
          mem[wrpt[2:0]]<=data_in;   
          wrpt<=wrpt+1;
        end 
          else
            wrpt<=wrpt;
       if(re&&!empty)
        begin
          data_out<=mem[rdpt[2:0]];
           rdpt<=rdpt+1;
        end 
          else
            rdpt<=rdpt;
    end
    end
  
  assign full = ((wrpt[3]!=rdpt[3])&&(wrpt[2:0]==rdpt[2:0]));
  
  assign empty = (wrpt==rdpt);
  
endmodule 
