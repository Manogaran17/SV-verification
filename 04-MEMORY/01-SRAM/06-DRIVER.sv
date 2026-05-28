class driver;
  
  transaction trans;
  
  mailbox #(transaction) gentodrv;
  
  virtual inter vif;
  
  
  function new(virtual inter vif, mailbox #(transaction) gentodrv);
    
    this.vif =  vif;
    
    this.gentodrv = gentodrv;
    
    endfunction
  
  task main();
    
    repeat(10)
      begin
        
           @(vif.cb);
        
        gentodrv.get(trans);
        
        vif.cb.rst <= trans.rst;
        vif.cb.we <= trans.we;
        vif.cb.addr <= trans.addr;
        
        vif.cb.data_in <= trans.data_in;
        
        $display("[DRIVER     ] |time = %0t |clk = %0b|rst = %b |we = %b|addr = %d|data_in = %d|data_out = %d",
                $time,
                 vif.clk,
                 trans.rst,
                 trans.we,
                 trans.addr,
                 trans.data_in,
                 trans.data_out
                );
        
      end 
  endtask
endclass:driver 



  
