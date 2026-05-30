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
  
    mailbox #(transaction)gentodrv;
    mailbox #(transaction)montoscb;

    virtual inter vif;

  function new(virtual inter vif);

        this.vif = vif;

        gentodrv = new();
        montoscb = new();
      
        gen = new(vif,gentodrv);
        drv = new(vif,gentodrv);
        mon = new(montoscb,vif);
        scb = new(vif,montoscb);

    endfunction

    task run();

        fork
            gen.main();
            drv.main();
            mon.main();
            scb.main();
        join_any

    endtask

endclass
