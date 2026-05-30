interface inter ( input logic clk);
  
  logic rst;
  logic we;
  logic re;
 
  logic [7:0]data_in;
  
  logic [7:0]data_out;
  logic full;
  logic empty;
  
  clocking cb @(posedge clk );
    
    default input #1step output #0;
    
    output  rst;
    output  we;
    output  re;
   
    output data_in;
    
    input  data_out;
    input full;
    input empty;
    
  endclocking 
  
endinterface 
