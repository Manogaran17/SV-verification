class scoreboard;

    transaction trans;

    mailbox #(transaction) montoscb;

    bit [7:0] ref_mem [7:0];

    virtual inter vif;

    function new(virtual inter vif,
                 mailbox #(transaction) montoscb);

        this.vif = vif;

        this.montoscb = montoscb;

    endfunction


    task main();

        trans = new();

        repeat(10)
        begin

            montoscb.get(trans);

            // RESET OPERATION
            if(trans.rst)
            begin

                ref_mem[trans.addr] = 0;

                if(trans.data_out == 0)

                  $display("[SCOREBOARD ] |time = %0t |clk = %0b |rst = %0b |we = %0b |addr = %0d |data_in = %0d |data_out = %0d |RESET TEST PASSED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we,
                             trans.addr,
                             trans.data_in,
                             trans.data_out);

                else

                  $display("[SCOREBOARD ] |time = %0t|clk = %0b|rst = %0b|we = %0b|addr = %0d|data_in = %0d|data_out = %0d|RESET TEST FAILED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we,
                             trans.addr,
                             trans.data_in,
                             trans.data_out);

            end


            // WRITE OPERATION
            else if(trans.we)
            begin

                ref_mem[trans.addr] = trans.data_in;

              $display("[SCOREBOARD ] |time = %0t|clk = %0b|rst = %0b|we = %0b|addr = %0d|data_in = %0d|data_out = %0d|WRITE TEST PASSED",
                         $time,
                         vif.clk,
                         trans.rst,
                         trans.we,
                         trans.addr,
                         trans.data_in,
                         trans.data_out);

            end


            // READ OPERATION
            else
            begin

                if(trans.data_out == ref_mem[trans.addr])

                  $display("[SCOREBOARD ] |time = %0t|clk = %0b|rst = %0b|we  = %0b|addr = %0d|data_in = %0d|data_out = %0d|READ TEST PASSED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we,
                             trans.addr,
                             trans.data_in,
                             trans.data_out);

                else

                  $display("[SCOREBOARD ] |time =  %0t|clk = %0b|rst = %0b|we = %0b|addr = %0d |data_in = %0d |data_out = %0d |READ TEST FAILED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we,
                             trans.addr,
                             trans.data_in,
                             trans.data_out);

            end

            $display("________________________________________________________________");

        end

    endtask

endclass : scoreboard
