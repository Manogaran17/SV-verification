`include "environment.sv"

program test(pipo_if vif);
    environment env;

    initial
    begin

        env = new(vif);
        env.run();
    end
endprogram
