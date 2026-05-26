
class monitor;

    virtual pipo_if vif;

    mailbox montoscb;

    function new(virtual pipo_if vif,mailbox montoscb);

        this.vif = vif;
        this.montoscb = montoscb;
    endfunction
  
    task main();
        transaction trans;

        repeat(10)
              begin

                @(vif.drv_cb);
          
            trans=new();

            trans.parallel_in=vif.parallel_in;

            trans.parallel_out=vif.parallel_out;

            trans.rst=vif.rst;
           
            $display("[MONITOR   ] Time=%0t | clk=%0b | rst=%0b | pin=%0b | pout=%0b",
                      $time,
                      vif.clk,
                      vif.rst,
                      vif.parallel_in,
                      vif.parallel_out);

            montoscb.put(trans);
        end
    endtask
endclass

