class scoreboard;
  
  mailbox montoscb;
  
  function new (mailbox montoscb);
    
    this.montoscb = montoscb;
    
  endfunction 
  
  task main();
    
    transaction trans;
    
    repeat(5)
      
      begin
        
        montoscb.get(trans);
        
        trans.display("scoreboard signals");
        
        // reference model
        
        if(((trans.a^trans.b^trans.cin)==trans.s)&&(((trans.a&trans.b)|(trans.b&trans.cin)|(trans.cin&trans.a))==trans.cout))
          $display("====test passed===");
          
        else 
          $display("===test failed===");
        $display("---------transaction completed------------");
        $display("                                          ");
        
      end 
  endtask
endclass

          
