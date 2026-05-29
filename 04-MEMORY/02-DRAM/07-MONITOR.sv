class monitor;
  
  transaction trans;
  
  mailbox #(transaction) montoscb;
  
  virtual inter vif;
  
  function new (mailbox #(transaction) montoscb, virtual inter vif);
    
    this.vif = vif;
    this.montoscb = montoscb;
    
  endfunction 
  
  task main();
    
    repeat(12)
      
      begin
        
         @(vif.cb); 
        
        trans = new();
        
        trans.rst = vif.rst;
  //=======================port 1======================================= 
        
        trans.we1 = vif.we1;
        
        trans.addr1 = vif.addr1;
        
        trans.data_in1 = vif.data_in1;
        
        trans.data_out1 = vif.data_out1;
        
 //=======================port 2======================================= 
        
         trans.we2 = vif.we2;
        
        trans.addr2 = vif.addr2;
        
        trans.data_in2 = vif.data_in2;
        
        trans.data_out2 = vif.data_out2;
        
          
        
        $display("[MONITOR  ] |time = %0t |clk = %0b|rst = %b |we1 = %b|we2 = %b|addr1 = %d|addr2 = %d|data_in1 = %d|data_in2 = %d|data_out1 = %d|data_out2 = %d",
                $time,
                 vif.clk,
                 vif.rst,
                 vif.we1,
                 vif.we2,
                 vif.addr1,
                 vif.addr2,
                 vif.data_in1,
                 vif.data_in2,
                 vif.data_out1,
                 vif.data_out2
                 
                );
         montoscb.put(trans);
        
      end 
  endtask
  
  endclass:monitor 
