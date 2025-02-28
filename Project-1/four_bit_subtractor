module one_bit_full_adder(A, B, Cin, S, Cout);
  
  input A, B, Cin;
  output S, Cout;
  
  assign S = A ^ B ^ Cin; 
  assign Cout = (A & B) | (B & Cin) | (Cin & A); 

  
endmodule



// 4-bit Ripple-Carry Subtractor!

module four_bit_RCS(A, B, Cin, S, Cout);
  
  
  input [3:0] A, B;
  input Cin;             
  output [3:0] S;
  output Cout;

  wire [2:0] Cinter;
  
  one_bit_full_adder F0 (A[0], !(B[0]), Cin, S[0], Cinter[0]);
  one_bit_full_adder F1 (A[1], !(B[1]), Cinter[0], S[1], Cinter[1]);
  one_bit_full_adder F2 (A[2], !(B[2]), Cinter[1], S[2], Cinter[2]);
  one_bit_full_adder F3 (A[3], !(B[3]), Cinter[2], S[3], Cout);
  
  
endmodule
