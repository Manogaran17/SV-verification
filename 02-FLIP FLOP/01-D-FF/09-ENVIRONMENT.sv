`include "transaction.sv"
`include "generator.sv" 
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  
  virtual inter vif;
  
  generator gen;
  
  driver drv;
  
  monitor mon;
  
  scoreboard scb;
  
  mailbox gentodrv;
  mailbox montoscb;
  
  function new(virtual inter vif);
    
    this.vif = vif;
    
    montoscb = new();
    gentodrv = new();
    
    gen = new(gentodrv,vif);
    drv = new(vif,gentodrv);
    mon = new(vif,montoscb);
    scb = new(montoscb,vif);
    
  endfunction 
  
  task run();
    
    fork
      
      gen.main();
      drv.main();
      mon.main();
      scb.main();
      
    join
    
  endtask
   
    endclass
    
  
  
