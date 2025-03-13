module one_bit_full_adder(A, B, Cin, S, Cout);
  
  input A, B, Cin;
  output S, Cout;
  
  assign S = A ^ B ^ Cin; 
  assign Cout = (A & B) | (B & Cin) | (Cin & A); 
  
endmodule


// 4-bit Ripple Carry Adder (RCA)
module four_bit_RCA(A, B, Cin, S, Cout);
  
  input [3:0] A, B;
  input Cin;             
  output [3:0] S;
  output Cout;

  wire [2:0] Cinter;
  
  one_bit_full_adder F0 (A[0], B[0], Cin, S[0], Cinter[0]);
  one_bit_full_adder F1 (A[1], B[1], Cinter[0], S[1], Cinter[1]);
  one_bit_full_adder F2 (A[2], B[2], Cinter[1], S[2], Cinter[2]);
  one_bit_full_adder F3 (A[3], B[3], Cinter[2], S[3], Cout);
  
endmodule


// Carry Lookahead Logic for 4-bit block
module carry_lookahead(A, B, Cin, Cout);
  
  input [3:0] A, B;
  input Cin;
  output Cout;
  
  wire [3:0] P, G;
  assign G = A & B;  // Generate
  assign P = A ^ B;  // Propagate

  assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
  
  
endmodule


// 32-bit Carry Lookahead Adder using 4-bit blocks
module CLA_32bit(A, B, Cin, S, Cout);
  
  input [31:0] A, B;
  input Cin;
  output [31:0] S;
  output Cout;
  
  wire [7:0] Carry; // Intermediate carry signals
  
  four_bit_RCA FA0 (A[3:0], B[3:0], Cin, S[3:0], Carry[0]);
  carry_lookahead CL0 (A[3:0], B[3:0], Cin, Carry[0]);
  
  four_bit_RCA FA1 (A[7:4], B[7:4], Carry[0], S[7:4], Carry[1]);
  carry_lookahead CL1 (A[7:4], B[7:4], Carry[0], Carry[1]);
  
  four_bit_RCA FA2 (A[11:8], B[11:8], Carry[1], S[11:8], Carry[2]);
  carry_lookahead CL2 (A[11:8], B[11:8], Carry[1], Carry[2]);
  
  four_bit_RCA FA3 (A[15:12], B[15:12], Carry[2], S[15:12], Carry[3]);
  carry_lookahead CL3 (A[15:12], B[15:12], Carry[2], Carry[3]);
  
  four_bit_RCA FA4 (A[19:16], B[19:16], Carry[3], S[19:16], Carry[4]);
  carry_lookahead CL4 (A[19:16], B[19:16], Carry[3], Carry[4]);
  
  four_bit_RCA FA5 (A[23:20], B[23:20], Carry[4], S[23:20], Carry[5]);
  carry_lookahead CL5 (A[23:20], B[23:20], Carry[4], Carry[5]);
  
  four_bit_RCA FA6 (A[27:24], B[27:24], Carry[5], S[27:24], Carry[6]);
  carry_lookahead CL6 (A[27:24], B[27:24], Carry[5], Carry[6]);
  
  four_bit_RCA FA7 (A[31:28], B[31:28], Carry[6], S[31:28], Cout);
  carry_lookahead CL7 (A[31:28], B[31:28], Carry[6], Cout);
  
  
endmodule
