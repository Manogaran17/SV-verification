
interface pipo_if(input logic clk);
  
    logic rst;
    logic [3:0] parallel_in;
    logic [3:0] parallel_out;


    clocking drv_cb @(posedge clk);
      
     default input #1step output #0;
 
        output rst;
        output parallel_in;
        input  parallel_out;

    endclocking

endinterface
