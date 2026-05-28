class monitor;
  
  transaction trans;
  
  mailbox #(transaction) montoscb;
  
  virtual inter vif;
  
  function new (mailbox #(transaction) montoscb, virtual inter vif);
    
    this.vif = vif;
    this.montoscb = montoscb;
    
  endfunction 
  
  task main();
    
    repeat(10)
      
      begin
        
         @(vif.cb); 
        
        trans = new();
        
        trans.rst = vif.rst;
        
        trans.we = vif.we;
        
        trans.addr = vif.addr;
        
        trans.data_in = vif.data_in;
        
        trans.data_out = vif.data_out;
        
          
        
        $display("[MONITOR    ] |time = %0t |clk = %0b|rst = %b |we = %b|addr = %d|data_in = %d|data_out = %d",
                $time,
                 vif.clk,
                 vif.rst,
                 vif.we,
                 vif.addr,
                 vif.data_in,
                 vif.data_out
                );
         montoscb.put(trans);
        
      end 
  endtask
  
  endclass:monitor 
  
