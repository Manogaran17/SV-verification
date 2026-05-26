class driver;

    virtual pipo_if vif;
    mailbox gentodrv;

    function new(virtual pipo_if vif, mailbox gentodrv);

        this.vif=vif;
        this.gentodrv=gentodrv;

    endfunction


    task main();
        transaction trans;

        repeat(10)
             begin
               
               @(vif.drv_cb);

            gentodrv.get(trans);

            vif.drv_cb.parallel_in<=trans.parallel_in;

            vif.drv_cb.rst<=trans.rst;
               
                $display("[DRIVER    ] Time=%0t | clk=%0b | rst=%0b | pin=%0b | pout=%0b",
                      $time,
                      vif.clk,
                      trans.rst,
                      trans.parallel_in,
                      trans.parallel_out);

        
        end

    endtask

endclass

