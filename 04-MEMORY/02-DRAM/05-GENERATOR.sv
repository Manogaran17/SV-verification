 
 class generator;
  
  transaction trans;
  
  mailbox #(transaction) gentodrv;
  
  virtual inter vif;
  
  logic [2:0] wr_addr1[$];
  logic [2:0] wr_addr2[$];
  
  function new(virtual inter vif, mailbox #(transaction) gentodrv);
    
    this.vif = vif;
    this.gentodrv = gentodrv;
    
  endfunction 
  
  task main();
    
    repeat(12)
      begin
        
        @(vif.cb);
        
        trans = new();
        
        trans.randomize();
        
        // FOR PORT 1
        
        if(trans.we1)
          wr_addr1.push_back(trans.addr1);

            // FOR READ OPERATION
            else
              trans.addr1 = wr_addr1[$urandom_range(0,wr_addr1.size()-1)];
        
        // FOR PORT 2
        
        if(trans.we2)
          wr_addr2.push_back(trans.addr2);

            // FOR READ OPERATION
            else
              trans.addr2 = wr_addr2[$urandom_range(0,wr_addr2.size()-1)];
        
       
        
        $display("[GENERATOR  ] |time = %0t |clk = %0b|rst = %b |we1 = %b|we2 = %b|addr1 = %d|addr2 = %d|data_in1 = %d|data_in2 = %d|data_out1 = %d|data_out2 = %d",
                $time,
                 vif.clk,
                 trans.rst,
                 trans.we1,
                 trans.we2,
                 trans.addr1,
                 trans.addr2,
                 trans.data_in1,
                 trans.data_in2,
                 trans.data_out1,
                 trans.data_out2
                );
        
         gentodrv.put(trans);
        
        
      end
    
  endtask
  
endclass:generator
