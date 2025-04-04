`timescale 1ns / 1ps

module testbench;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] S;
  wire Cout;

  // Instantiate the 4-bit Ripple-Carry Subtractor (RCS)
  four_bit_RCS uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

  initial begin

    $dumpfile("waveform.vcd"); // VCD file for waveform
    $dumpvars(0, testbench);   // Dump all variables in testbench

    $display("A     B     Cin | S     Cout");
    $display("----------------------------");

   
    Cin = 1; A = 4'b0000; B = 4'b0000; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b0001; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b0010; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b0011; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b0100; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b0101; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b0110; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b0111; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1000; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1001; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1010; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1011; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1100; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1101; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1110; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    Cin = 1; A = 4'b0000; B = 4'b1111; #10;
    $display("%b  %b   %b   | %b  %b", A, B, Cin, S, Cout);

    $finish;
  end
endmodule
