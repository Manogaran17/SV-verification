`include "interface.sv"
`include "test.sv"
module top_tb;
    logic clk;
    initial
      begin

        clk=0;
        forever #10 clk = ~clk;
    end

  inter vif(clk); // interface instance

  FIFO_syn dut(  // DUT
  
    .clk(clk),
    .rst(vif.rst),
    .we(vif.we),
    .re(vif.re),
    .data_in(vif.data_in),
    .data_out(vif.data_out),
    .full(vif.full),
    .empty(vif.empty)
    
  );
  

  test t1(vif);   // TEST 

    initial
    begin

        $dumpfile("dump.vcd");
        $dumpvars;
        #2000 $finish;
    end

endmodule
