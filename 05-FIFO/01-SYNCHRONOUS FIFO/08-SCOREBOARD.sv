class scoreboard;

  transaction trans;

  mailbox #(transaction) montoscb;

  virtual inter vif;

  bit [7:0] fifo_q[$];

  bit [7:0] exp_data;

  bit exp_full;
  bit exp_empty;

  int error_count;

  function new
  (
    virtual inter vif,
    mailbox #(transaction) montoscb
  );

    this.vif      = vif;
    this.montoscb = montoscb;

    exp_full  = 0;
    exp_empty = 1;

  endfunction


  task main();

    repeat(26)
    begin

      montoscb.get(trans);


//====================================================
// RESET CHECK
//====================================================

      if(trans.rst)
      begin

        fifo_q.delete();

        exp_full  = 0;
        exp_empty = 1;

        exp_data  = 0;

        if(trans.data_out == 0)

          $display("[SCOREBOARD ] |time=%0t |RESET TEST PASSED",
                    $time);

        else
        begin

          $display("[SCOREBOARD ] |time=%0t |RESET TEST FAILED",
                    $time);

          error_count++;

        end

      end

      else
      begin


//====================================================
// FLAG CHECK
//====================================================

        if(exp_full != trans.full)
        begin

          $display("[SCOREBOARD ] FULL FLAG ERROR");

          error_count++;

        end


        if(exp_empty != trans.empty)
        begin

          $display("[SCOREBOARD ] EMPTY FLAG ERROR");

          error_count++;

        end


//====================================================
// WRITE CHECK
//====================================================

        if(trans.we && !trans.full)
        begin

          fifo_q.push_back(trans.data_in);

          $display("[SCOREBOARD ] |time = %0t |clk = %0b|rst = %0b |we = %0b|re = %0b|full = %0b|empty = %0b|data_in = %0d|data_out = %0d|WRITE TEST PASSED",
                    $time,
                    vif.clk,
                    trans.rst,
                    trans.we,
                    trans.re,
                    trans.full,
                    trans.empty,
                    trans.data_in,
                    trans.data_out);

        end


//====================================================
// READ CHECK
//====================================================

        if(trans.re && !trans.empty)
        begin

          exp_data = fifo_q.pop_front();

          if(trans.data_out == exp_data)

            $display("[SCOREBOARD ] |time = %0t |clk = %0b|rst = %0b |we = %0b|re = %0b|full = %0b|empty = %0b|data_in = %0d|data_out = %0d|READ TEST PASSED",
                      $time,
                      vif.clk,
                      trans.rst,
                      trans.we,
                      trans.re,
                      trans.full,
                      trans.empty,
                      trans.data_in,
                      trans.data_out);

          else
          begin

            $display("[SCOREBOARD ] |time = %0t |clk = %0b|rst = %0b |we = %0b|re = %0b|full = %0b|empty = %0b|EXPECTED = %0d|ACTUAL = %0d|READ TEST FAILED",
                      $time,
                      vif.clk,
                      trans.rst,
                      trans.we,
                      trans.re,
                      trans.full,
                      trans.empty,
                      exp_data,
                      trans.data_out);

            error_count++;

          end

        end


//===================================================
// PREDICT NEXT FLAGS
//===================================================

        exp_empty = (fifo_q.size() == 0);

        exp_full  = (fifo_q.size() == 8);

      end

      $display("____________________________________________________________________________________________________________________________________________");

    end

  endtask

endclass
