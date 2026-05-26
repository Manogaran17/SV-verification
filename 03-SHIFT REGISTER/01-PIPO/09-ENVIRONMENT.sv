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
  
    mailbox gentodrv;
    mailbox montoscb;

    virtual pipo_if vif;

    function new(virtual pipo_if vif);

        this.vif = vif;

        gentodrv = new();
        montoscb = new();
        gen = new(gentodrv,vif);
        drv = new(vif,gentodrv);
        mon = new(vif,montoscb);
        scb = new(montoscb);

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
