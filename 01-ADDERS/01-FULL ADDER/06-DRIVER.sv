class driver;
  
  virtual inter vif;
  event done;
  
  mailbox gentodrv;
  
  function new (virtual inter vif,mailbox gentodrv,event done);
    
    this.vif = vif;
    this.gentodrv = gentodrv;
    this.done=done;
    endfunction
  
  task main();
    
    repeat(5)
      begin
        
        transaction trans;
        
        gentodrv.get(trans);
        
        // driver to get the transaction from  mailbox to driver
        
         vif.a <= trans.a;
         vif.b <= trans.b;
         vif.cin <= trans.cin;
        #1;
        ->done;
        trans.display("driver class signals");
        
        
      end 
    
  endtask
  
endclass

        
