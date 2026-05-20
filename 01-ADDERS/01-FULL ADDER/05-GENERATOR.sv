class generator;
  
  transaction trans;
  
  mailbox gentodrv;
  
  function new ( mailbox gentodrv);
    
    this.gentodrv=gentodrv;
    
  endfunction
  
  task main();
    
    repeat (5)
      begin
        
        trans = new();
        
        trans.randomize();
        
        trans.display("generator class signals");
        
        gentodrv.put(trans);
        
        #10;
        
      end 
  endtask
endclass
