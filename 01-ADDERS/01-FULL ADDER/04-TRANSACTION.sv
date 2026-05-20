class transaction;
  
  rand bit a;
  rand bit b;
  rand bit cin;
  
  bit s;
  bit cout;
  
  function void display(string name );
    
    $display("====%s=====",name);
    $display("a=%0b,b=%0b,cin=%0b,s=%0b,cout=%0b",a,b,cin,s,cout);
    $display("___________________________________________________");
    $display("                                                   ");
    
  endfunction
  
endclass
