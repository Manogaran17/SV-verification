// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"

module top_testbench;
  
  inter interf(); // interface instance
  
  test test1(interf); // test
  
  
  fa_struc FA(
  
    .a(interf.a),
    .b(interf.b),
    .cin(interf.cin),
    .s(interf.s),
    .cout(interf.cout)
    
  );
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end 
  initial 
    #150 $finish;
  
endmodule 
