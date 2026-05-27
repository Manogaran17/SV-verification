class generator;

    transaction trans;
    mailbox gentodrv;

    virtual inter vif;
  
  function new(mailbox gentodrv, virtual inter vif);

        this.gentodrv=gentodrv;
        this.vif=vif;

    endfunction


    task main();

        repeat(10)
           begin
             
             @(vif.cb);

            trans=new();

            trans.randomize();
             
             $display("[GENERATOR  ] Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b",
                      $time,
                      vif.clk,
                      trans.rst,
                      trans.d,
                      trans.q);

            gentodrv.put(trans);
          
        end
    endtask
endclass
