// Code your testbench here
// or browse Examples

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

  dual_port dut(  // DUT
  
    .clk(clk),
    .rst(vif.rst),
    .we1(vif.we1),
    .we2(vif.we2),
    .addr1(vif.addr1),
    .addr2(vif.addr2),
    .data_in1(vif.data_in1),
    .data_in2(vif.data_in2),
    .data_out1(vif.data_out1),
    .data_out2(vif.data_out2)
    
  );
  

  test t1(vif);   // TEST 

    initial
    begin

        $dumpfile("dump.vcd");
        $dumpvars;
        #250 $finish;
    end

endmodule
