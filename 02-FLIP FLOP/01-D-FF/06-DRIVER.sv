class driver;

    virtual inter vif;
  
    mailbox gentodrv;

  function new(virtual inter vif, mailbox gentodrv);

        this.vif=vif;
        this.gentodrv=gentodrv;

    endfunction


    task main();
      
        transaction trans;

        repeat(10)
             begin
               
                @(vif.cb);

            gentodrv.get(trans);
               
            vif.cb.d<=trans.d;

            vif.cb.rst<=trans.rst;
               
               $display("[DRIVER    ] Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b",
                      $time,
                      vif.clk,
                      trans.rst,
                      trans.d,
                      trans.q);

        
        end

    endtask

endclass

