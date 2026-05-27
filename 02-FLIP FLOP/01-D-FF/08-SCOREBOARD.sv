class scoreboard;

  
  mailbox montoscb;
  
  virtual inter vif;
  
  function new( mailbox montoscb,virtual inter vif);
    
    this.montoscb = montoscb;
    
    this.vif=vif;
    
    
  endfunction 
  
  task main();
     transaction trans;
     
 bit prev_d; 
    repeat(10)
      begin
        
        montoscb.get(trans);
        
        if(trans.rst)
          begin
            
            if(trans.q == 0)
              $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b | RESET TEST PASSED ",
                              $time,
                              vif.clk,
                              trans.rst,
                              trans.d,
                              trans.q);
            else
              
              $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b | RESET TEST FAILED ",
                              $time,
                              vif.clk,
                              trans.rst,
                              trans.d,
                              trans.q);
            
          end 
        
        else
          begin
            
            if(trans.q == trans.d)
              $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b | D_FF TEST PASSED ",
                              $time,
                              vif.clk,
                              trans.rst,
                              trans.d,
                              trans.q);
            else
              
              $display("[SCOREBOARD] Time=%0t | clk=%0b | rst=%0b | d=%0b | q=%0b | D_FF TEST FAILED ",
                              $time,
                              vif.clk,
                              trans.rst,
                              trans.d,
                              trans.q);
            
          end 
        
        $display("______________________________________________________________");
        
      end 
  endtask
endclass
