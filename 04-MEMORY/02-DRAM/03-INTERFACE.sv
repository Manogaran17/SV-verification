interface inter ( input logic clk);
  
  logic rst;
  logic we1;
  logic we2;
  logic [2:0]addr1;
  logic [2:0]addr2;
  logic [7:0]data_in1;
  logic [7:0]data_in2;
  logic [7:0]data_out1;
  logic [7:0]data_out2;
  
  clocking cb @(posedge clk );
    
    default input #1step output #0;
    
    output  rst;
    output  we1;
    output  addr1;
    output data_in1;
    
    input  data_out1;
    
  
    output  we2;
    output  addr2;
    output data_in2;
    
    input  data_out2;
    
  endclocking 
  
endinterface 

