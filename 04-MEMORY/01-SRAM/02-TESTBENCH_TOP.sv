// Code your testbench here
// or browse Examples

`include "interface.sv"
`include "test.sv"
module top_tb;

    logic clk;


    initial
      begin

        clk=0;
        forever #10clk=~clk;
    end

  inter vif(clk); // interface instance

  single_portRAM dut(
  
    .clk(clk),
    .rst(vif.rst),
    .we(vif.we),
    .addr(vif.addr),
    .data_in(vif.data_in),
    .data_out(vif.data_out)
    
  );
  

    test t1(vif);

    initial
    begin

        $dumpfile("dump.vcd");
        $dumpvars;
        #250 $finish;
    end

endmodule
