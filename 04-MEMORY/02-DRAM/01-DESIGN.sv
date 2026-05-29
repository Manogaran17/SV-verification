// Code your design here

module dual_port(clk,rst,we1,we2,addr1,addr2,data_in1,data_in2,data_out1,data_out2);
  input clk,rst,we1,we2;
  input [2:0]addr1,addr2;
  input [7:0]data_in1,data_in2;
  output reg[7:0]data_out1,data_out2;
  
  reg[7:0]ram[7:0];
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
        data_out1<=0;
        data_out2<=0;
        ram[addr1]<=0;
        ram[addr2]<=0;
        end 
      else
        begin
    if (we1 && we2)
    begin
        if (addr1 != addr2)
        begin
          ram[addr1] <= data_in1;
          ram[addr2] <= data_in2;
        end
        else
        begin
          ram[addr1] <= data_in1;
        end
    end  
    else if (we1 && !we2)
    begin
        if (addr1 != addr2)
        begin
          ram[addr1] <= data_in1;
            data_out2   <= ram[addr2];
        end
        else
        begin
          ram[addr1] <= data_in1;
            data_out2   <= data_in1;
        end
    end

    else if (!we1 && we2)
    begin
        if (addr1 != addr2)
        begin
            
          ram[addr2] <= data_in2;
            data_out1   <= ram[addr1];
        end
        else
        begin

          ram[addr2] <= data_in2;
            data_out1   <= data_in2;
        end
    end

    else
    begin
        if (addr1 != addr2)
        begin
           
            data_out1 <= ram[addr1];
            data_out2 <= ram[addr2];
        end
        else
        begin
            data_out1 <= ram[addr1];
            data_out2 <= ram[addr1];
        end
    end
end
    end 
endmodule 
