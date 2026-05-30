class monitor;
  
  transaction trans;
  
  mailbox #(transaction) montoscb;
  
  virtual inter vif;
  
  function new (mailbox #(transaction) montoscb, virtual inter vif);
    
    this.vif = vif;
    this.montoscb = montoscb;
    
  endfunction 
  
  task main();
    
    repeat(26)
      
      begin
        
         @(vif.cb); 
        #1;
        
        trans = new();
        
        trans.rst = vif.rst;
        
        trans.we = vif.we;
        
        trans.re = vif.re;
        
        trans.data_in = vif.data_in;
        
       
        
        trans.full = vif.full;
        
        trans.empty = vif.empty;
       
        
         trans.data_out = vif.data_out;
     
        
        $display("[MONITOR  ] |time = %0t |clk = %0b|rst = %b |we = %b|re = %b|full = %b|empty = %b|data_in = %d|data_out = %d",
                $time,
                 vif.clk,
                 trans.rst,
                 trans.we,
                 trans.re,
                 trans.full,
                 trans.empty,
                 trans.data_in,
                 trans.data_out
                );
        
        
         montoscb.put(trans);
        
      end 
  endtask
  
  endclass:monitor 
