// Code your testbench here
// or browse Examples

`include "interface.sv"
`include "test.sv"

module top_tb;
  
  logic clk;
  
  initial 
    begin
      
      clk=0;
      forever #5 clk = ~clk;
      
    end 
  
  inter vif(clk);
  
  d_ff dut(
  
    .d(vif.d),
    .clk(vif.clk),
    .rst(vif.rst),
    .q(vif.q)
  );
  
  test t1(vif);
  
    initial
    begin

        $dumpfile("dump.vcd");
        $dumpvars;
        #250 $finish;
    end

endmodule
  
  
  
