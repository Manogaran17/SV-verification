class generator;
  
  transaction trans;
  
  mailbox #(transaction) gentodrv;
  
  virtual inter vif;
  
  logic [2:0] wr_addr[$];
  
  function new(virtual inter vif, mailbox #(transaction) gentodrv);
    
    this.vif = vif;
    this.gentodrv = gentodrv;
    
  endfunction 
  
  task main();
    
    repeat(10)
      begin
        
        @(vif.cb);
        
        trans = new();
        
        trans.randomize();
        
         if(trans.we)
                wr_addr.push_back(trans.addr);

            // FOR READ OPERATION
            else
                trans.addr = wr_addr[$urandom_range(0,wr_addr.size()-1)];
        
       
        
        $display("[GENERATOR  ] |time = %0t |clk = %0b|rst = %b |we = %b|addr = %d|data_in = %d|data_out = %d",
                $time,
                 vif.clk,
                 trans.rst,
                 trans.we,
                 trans.addr,
                 trans.data_in,
                 trans.data_out
                );
        
         gentodrv.put(trans);
        
        
      end
    
  endtask
  
endclass:generator

