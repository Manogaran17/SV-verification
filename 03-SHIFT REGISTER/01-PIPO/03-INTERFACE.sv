

interface pipo_if(input logic clk);
  
    logic rst;
    logic [3:0] parallel_in;
    logic [3:0] parallel_out;


    clocking cb @(posedge clk);
 
        output rst;
        output parallel_in;

        input parallel_out;

    endclocking

endinterface
