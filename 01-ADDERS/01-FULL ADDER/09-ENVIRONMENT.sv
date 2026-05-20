`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  event done;
  
  mailbox gentodrv;
  mailbox montoscb;
  
  virtual inter vif;
  
  function new (virtual inter vif);
    
    this.vif = vif;
    
    gentodrv = new();
    montoscb = new();
    gen = new(gentodrv);
    drv = new (vif,gentodrv,done);
    mon = new(vif,montoscb,done);
    scb = new(montoscb);
    
  endfunction
  
  task test_run();
    
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
    
  endtask
  
endclass
  
  
