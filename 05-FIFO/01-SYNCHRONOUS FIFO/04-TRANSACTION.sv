class transaction;

  static int count;

  rand bit rst;
  rand bit we;
  rand bit re;

  rand bit [7:0] data_in;

  bit [7:0] data_out;
  bit full;
  bit empty;
  // Reset only for first transaction
  constraint rst_c
  {
    if(count==0)
      rst==1;
    else
      rst==0;
  }
  // 5 writes followed by 5 reads
  constraint fifo_c
  {
    if(count>=0&&count<=15)
    {
      we==1;
      re==0;
    }
      if(count>=16&&count<=26)
    {
      we==0;
      re==1;
    }
  }
  constraint read_c
  {
    if(re)
      data_in==0;
  }
  function void post_randomize();
    count++;
  endfunction

endclass
