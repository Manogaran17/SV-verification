class transaction;
  
   bit rst;
  rand bit we;
  rand bit [2:0]addr;
  rand bit [7:0]data_in;
  
  bit [7:0]data_out;
  static int count;
  
  constraint wr_c
  {
    if(count < 5)
      we == 1;
    else 
      we == 0;
  }
  
  constraint rd_c
  {
  if(we==0)
    data_in==0;
  }
  
  function void post_randomize(); 
    count++;
  endfunction 
  
endclass 
