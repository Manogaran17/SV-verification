class scoreboard;

    mailbox montoscb;

    function new(mailbox montoscb);

        this.montoscb = montoscb;

    endfunction


    task main();

        transaction trans;

        repeat(10)
            begin

            montoscb.get(trans);

            if(trans.rst)
                 begin
                if(trans.parallel_out==0)

                    $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | pin=%0b | pout=%0b | TEST PASSED",
                              $time,
                              1'b1,
                              trans.rst,
                              trans.parallel_in,
                              trans.parallel_out);
                else
                    $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | pin=%0b | pout=%0b | TEST FAILED",
                              $time,
                              1'b1,
                              trans.rst,
                              trans.parallel_in,
                              trans.parallel_out);
            end
            else
               begin
                if(trans.parallel_in==trans.parallel_out)
                    $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | pin=%0b | pout=%0b | TEST PASSED",
                              $time,
                              1'b1,
                              trans.rst,
                              trans.parallel_in,
                              trans.parallel_out);
                else
                    $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | pin=%0b | pout=%0b | TEST FAILED",
                              $time,
                              1'b1,
                              trans.rst,
                              trans.parallel_in,
                              trans.parallel_out);
            end
            $display("");
        end
        endtask
endclass


