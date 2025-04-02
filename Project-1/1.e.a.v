`timescale 1ns / 1ps

module testbench;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] S;
  wire Cout;

  
  four_bit_RCA uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

  initial begin

    $dumpfile("waveform.vcd"); // VCD file for waveform
    $dumpvars(0, testbench);   // Dump all variables in testbench


    // Print header for clarity
    $display("A     B     Cin | S     Cout");
    $display("----------------------------");

    // Test case 1: A = 0000, B = 0000, Cin = 0
    A = 4'b0000; B = 4'b0000; Cin = 0; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    // Test case 2: A = 0001, B = 0001, Cin = 0
    A = 4'b0001; B = 4'b0001; Cin = 0; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    // Test case 3: A = 0010, B = 0011, Cin = 0
    A = 4'b0010; B = 4'b0011; Cin = 0; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    // Test case 4: A = 0101, B = 1011, Cin = 0
    A = 4'b0101; B = 4'b1011; Cin = 0; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    // Test case 5: A = 1111, B = 0001, Cin = 0
    A = 4'b1111; B = 4'b0001; Cin = 0; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    // Test case 6: A = 1111, B = 1111, Cin = 0
    A = 4'b1111; B = 4'b1111; Cin = 0; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    // Test case 7: A = 1111, B = 1111, Cin = 1
    A = 4'b1111; B = 4'b1111; Cin = 1; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    // Test case 8: A = 1010, B = 1100, Cin = 1
    A = 4'b1010; B = 4'b1100; Cin = 1; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    $finish;
  end
endmodule
