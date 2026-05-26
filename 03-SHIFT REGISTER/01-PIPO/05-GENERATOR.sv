class generator;

    transaction trans;
    mailbox gentodrv;

    virtual pipo_if vif;
    function new(mailbox gentodrv, virtual pipo_if vif);

        this.gentodrv=gentodrv;
        this.vif=vif;

    endfunction


    task main();

        repeat(10)
           begin
             
             @(vif.drv_cb);

            trans=new();

            trans.randomize();
             
             $display("[GENERATOR ] Time=%0t | clk=%0b | rst=%0b | pin=%0b | pout=%0b",
                      $time,
                      vif.clk,
                      trans.rst,
                      trans.parallel_in,
                      trans.parallel_out);

            gentodrv.put(trans);
          
        end
    endtask
endclass
