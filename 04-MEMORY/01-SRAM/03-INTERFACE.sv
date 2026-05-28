interface inter ( input logic clk);
  
  logic rst;
  logic we;
  logic [2:0]addr;
  logic [7:0]data_in;
  logic [7:0]data_out;
  
  clocking cb @(posedge clk );
    
    default input #1step output #0;
    
    output  rst;
    output  we;
    output  addr;
    output data_in;
    
    input  data_out;
    
  endclocking 
  
endinterface 
