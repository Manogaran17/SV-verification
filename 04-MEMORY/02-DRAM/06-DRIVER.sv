
class driver;
  
  transaction trans;
  
  mailbox #(transaction) gentodrv;
  
  virtual inter vif;
  
  
  function new(virtual inter vif, mailbox #(transaction) gentodrv);
    
    this.vif =  vif;
    
    this.gentodrv = gentodrv;
    
    endfunction
  
  task main();
    
    repeat(12)
      begin
        
           @(vif.cb);
        
        gentodrv.get(trans);
        
//=====================PORT - 1===================================
        
        vif.cb.rst <= trans.rst;
        vif.cb.we1 <= trans.we1;
        vif.cb.addr1 <= trans.addr1;
        
        vif.cb.data_in1 <= trans.data_in1;
        
//=====================PORT - 2===================================
        
        vif.cb.we2 <= trans.we2;
        vif.cb.addr2 <= trans.addr2;
        
        vif.cb.data_in2 <= trans.data_in2;
        
        
        $display("[DRIVER  ] |time = %0t |clk = %0b|rst = %b |we1 = %b|we2 = %b|addr1 = %d|addr2 = %d|data_in1 = %d|data_in2 = %d|data_out1 = %d|data_out2 = %d",
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
        
      end 
    
  endtask
  
endclass:driver 



