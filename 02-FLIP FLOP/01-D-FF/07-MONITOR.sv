class monitor;
  
  transaction trans;
  
  mailbox montoscb;
  
  virtual inter vif;
  
  function new(virtual inter vif,mailbox montoscb);
    
    this.vif=vif;
    
    this.montoscb=montoscb;
    
  endfunction
  
  task main();
    
    repeat(10)
      begin
        
        @(vif.cb);
        
        trans=new();
        
        trans.d =vif.d;
        trans.rst =vif.rst;
        trans.q =vif.q;
        
        $display("[MONITOR   ] Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b",
                      $time,
                      vif.clk,
                      vif.rst,
                      vif.d,
                      vif.q);

        
        montoscb.put(trans);
      end 
  endtask
endclass

