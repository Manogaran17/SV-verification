// Code your design here

module fa_struc(a,b,cin,s,cout);
  
  input a,b,cin;
  output s,cout;
  wire s1,c1,c2;
  
  //sum
  xor g1(s1,a,b);
  xor g2(s,s1,cin);
  
  //carry
  and g3(c1,a,b);
  and g4(c2,cin,s1);
  or g5(cout,c2,c1);
  
endmodule
