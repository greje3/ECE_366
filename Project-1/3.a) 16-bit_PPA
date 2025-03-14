module Prefix_Adder (A, B, Cin, Sum, Cout);
  
    input [15:0] A, B;
    input Cin;
    output [15:0] Sum;
    output Cout;

    wire [15:0] P, G;
    wire [15:0] C;

    // Compute Propagate and Generate
    genvar i;
    generate 
        for (i = 0; i < 16; i = i + 1) begin
            assign P[i] = A[i] ^ B[i]; // XOR for Propagate
            assign G[i] = A[i] & B[i]; // Generate
        end
    endgenerate

    // Carry Computation using Prefix Tree
    assign C[0] = Cin; // Initial carry-in
    
    generate 
        for (i = 1; i < 16; i = i + 1) begin
          assign C[i] = G[i-1] | (P[i-1] & C[i-1]); // Carry calculation
        end
    endgenerate

    // Compute Sum
    generate 
        for (i = 0; i < 16; i = i + 1) begin
            assign Sum[i] = A[i] ^ B[i] ^ C[i]; // Sum formula
        end
    endgenerate

    assign Cout = G[15] | (P[15] & C[15]); // Final carry-out
endmodule
