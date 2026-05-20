class monitor;
  
  virtual inter vif;
  event done;
  
  mailbox montoscb;
  
  function new (virtual inter vif, mailbox montoscb,event done);
    
    this.vif = vif;
    this.montoscb = montoscb;
    this.done = done;
    
    
  endfunction
  
  task main();
    
    repeat(5)
     
      begin
        
        transaction trans;
        
        @(done);
         trans = new();
         trans.a = vif.a;
         trans.b = vif.b;
         trans.cin = vif.cin;
         trans.s = vif.s;
         trans.cout = vif.cout;
        
        montoscb.put(trans);
        
        trans.display("monitor class signals");
        
      end 
  endtask
  
endclass


        
