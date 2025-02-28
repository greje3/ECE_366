// Structural model!

module one_bit_full_adder2(A, B, Cin, S, Cout);
  
  input A, B, Cin;
  output S, Cout;
  
  wire AxorB, AB, BCin, ACin;

  //XOR 
  
  xor (AxorB, A, B);
  xor (S, AxorB, Cin);
  
  //AND and OR gates
  
  and (AB, A, B);
  and (BCin, B, Cin);
  and (ACin, A, Cin);
  
  or (Cout, AB, BCin, ACin);
  
endmodule
