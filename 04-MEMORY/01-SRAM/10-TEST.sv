`include "environment.sv"
program test(inter vif);
  
  environment env;
  
  initial 
    begin
      
      env = new(vif);
      env.run();
      
    end
  
endprogram 
