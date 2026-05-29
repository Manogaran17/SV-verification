class transaction;

  rand bit rst;

  // ================= PORT-1 =================

  rand bit        we1;
  rand bit [2:0]  addr1;
  rand bit [7:0]  data_in1;

  bit [7:0] data_out1;

  // ================= PORT-2 =================

  rand bit        we2;
  rand bit [2:0]  addr2;
  rand bit [7:0]  data_in2;

  bit [7:0] data_out2;

  rand bit [1:0] op_mode;

  /*
      00 -> READ  READ
      01 -> READ  WRITE
      10 -> WRITE READ
      11 -> WRITE WRITE
  */

  constraint operation_c
  {
      (op_mode==2'b00)->(we1==0&&we2==0);

      (op_mode==2'b01)->(we1==0&&we2==1);

      (op_mode==2'b10)->(we1==1&&we2==0);

      (op_mode==2'b11)->(we1==1&&we2==1);

  }


  constraint rd_c
  {
      if(we1==0)
          data_in1==0;

      if(we2==0)
          data_in2==0;
  }


  constraint mode_dist
  {
      op_mode dist
      {
          2'b00:=3,
          2'b01:=3,
          2'b10:=3,
          2'b11:=3
      };
  }
endclass
