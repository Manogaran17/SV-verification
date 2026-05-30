 
 class generator;
  
  transaction trans;
  
  mailbox #(transaction) gentodrv;
  
  virtual inter vif;
  
   
  function new(virtual inter vif, mailbox #(transaction) gentodrv);
    
    this.vif = vif;
    this.gentodrv = gentodrv;
    
  endfunction 
   
  
  task main();
    
    repeat(26)
      begin
        
        @(vif.cb);
        
        trans = new();
        
        trans.randomize();     
        
        $display("[GENERATOR  ] |time = %0t |clk = %0b|rst = %b |we = %b|re = %b|full = %b|empty = %b|data_in = %d|data_out = %d",
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
        
         gentodrv.put(trans);
        
        
      end
    
  endtask
  
endclass:generator
