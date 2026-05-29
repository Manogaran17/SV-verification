
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

      repeat(12)
        begin

            montoscb.get(trans);

            // RESET OPERATION
            if(trans.rst)
            begin

              ref_mem[trans.addr1] = 0;
              ref_mem[trans.addr2] = 0;

              if(trans.data_out1 == 0&&trans.data_out2 == 0)
                

                  
                $display("[SCOREBOARD  ] |time = %0t |clk = %0b|rst = %b |we1 = %b|we2 = %b|addr1 = %d|addr2 = %d|data_in1 = %d|data_in2 = %d|data_out1 = %d|data_out2 = %d|RESET TEST PASSED",
                $time,
                 vif.clk,
                 trans.rst,
                 trans.we1,
                 trans.we2,
                 trans.addr1,
                 trans.addr2,
                 trans.data_in1,
                 trans.data_in2,
                 trans.data_out1,
                 trans.data_out2
                );
        

                else

                   
                  $display("[SCOREBOARD  ] |time = %0t |clk = %0b|rst = %b |we1 = %b|we2 = %b|addr1 = %d|addr2 = %d|data_in1 = %d|data_in2 = %d|data_out1 = %d|data_out2 = %d|RESET TEST FAILED",
                $time,
                 vif.clk,
                 trans.rst,
                 trans.we1,
                 trans.we2,
                 trans.addr1,
                 trans.addr2,
                 trans.data_in1,
                 trans.data_in2,
                 trans.data_out1,
                 trans.data_out2
                );
              $display("_____________________________________________________________________");
        


            end
          
          else 
            begin
              
//==========================PORT A======================================              

            // WRITE OPERATION
          if(trans.we1)
            begin

              ref_mem[trans.addr1] = trans.data_in1;

              $display("[SCOREBOARD ] |time = %0t|clk = %0b|rst = %0b|we1 = %0b|addr1 = %0d|data_in1 = %0d|data_out1 = %0d|WRITE TEST PASSED",
                         $time,
                         vif.clk,
                         trans.rst,
                         trans.we1,
                         trans.addr1,
                         trans.data_in1,
                         trans.data_out1);

            end


            // READ OPERATION
            else
            begin

              if(trans.data_out1 == ref_mem[trans.addr1])

                $display("[SCOREBOARD ] |time = %0t|clk = %0b|rst = %0b|we1  = %0b|addr1 = %0d|data_in1 = %0d|data_out1 = %0d|READ TEST PASSED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we1,
                             trans.addr1,
                             trans.data_in1,
                             trans.data_out1);

                else

                  $display("[SCOREBOARD ] |time =  %0t|clk = %0b|rst = %0b|we1 = %0b|addr1 = %0d |data_in1 = %0d |data_out1 = %0d |READ TEST FAILED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we1,
                             trans.addr1,
                             trans.data_in1,
                             trans.data_out1);

            end


      
//==========================PORT B======================================              

            // WRITE OPERATION
              if(trans.we2)
            begin

              ref_mem[trans.addr2] = trans.data_in2;

              $display("[SCOREBOARD ] |time = %0t|clk = %0b|rst = %0b|we2 = %0b|addr2 = %0d|data_in2 = %0d|data_out2 = %0d|WRITE TEST PASSED",
                         $time,
                         vif.clk,
                         trans.rst,
                         trans.we2,
                         trans.addr2,
                         trans.data_in2,
                         trans.data_out2);

            end


            // READ OPERATION
            else
            begin

              if(trans.data_out2 == ref_mem[trans.addr2])

                $display("[SCOREBOARD ] |time = %0t|clk = %0b|rst = %0b|we2  = %0b|addr2 = %0d|data_in2 = %0d|data_out2 = %0d|READ TEST PASSED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we2,
                             trans.addr2,
                             trans.data_in2,
                             trans.data_out2);

                else

                  $display("[SCOREBOARD ] |time =  %0t|clk = %0b|rst = %0b|we2 = %0b|addr2 = %0d |data_in2 = %0d |data_out2 = %0d |READ TEST FAILED",
                             $time,
                             vif.clk,
                             trans.rst,
                             trans.we2,
                             trans.addr2,
                             trans.data_in2,
                             trans.data_out2);

            end

            $display("________________________________________________________________");

        end
          
        end

    endtask

endclass : scoreboard
