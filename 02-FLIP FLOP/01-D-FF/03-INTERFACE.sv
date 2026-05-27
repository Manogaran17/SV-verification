
interface inter(input logic clk);
  
    logic d;
    logic rst;
   
    logic q;


    clocking cb @(posedge clk);
      
     default input #1step output #0;
 
        output rst;
        output d;
        input  q;

    endclocking

endinterface
