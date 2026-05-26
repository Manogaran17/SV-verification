`include "interface.sv"
`include "test.sv"
module top_tb;

    logic clk;


    initial
      begin

        clk=0;
        forever #10clk=~clk;
    end

    pipo_if vif(clk); 

    pipo_shift_register dut
    (
        .clk(clk),
        .rst(vif.rst),
        .parallel_in(vif.parallel_in),
        .parallel_out(vif.parallel_out)
    );

    test t1(vif);

    initial
    begin

        $dumpfile("dump.vcd");
        $dumpvars;
        #250 $finish;
    end

endmodule
