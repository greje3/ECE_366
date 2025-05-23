`timescale 1ns / 1ps

module testbench;
  reg A, B, Cin;
  wire S, Cout;

  
  one_bit_full_adder uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

  initial begin

    $dumpfile("waveform.vcd"); // VCD file for waveform
    $dumpvars(0, testbench);   // Dump all variables in testbench


    $display("A  B  Cin | S  Cout");
    $display("-------------------");


    A = 0; B = 0; Cin = 0; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    A = 0; B = 0; Cin = 1; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    A = 0; B = 1; Cin = 0; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    A = 0; B = 1; Cin = 1; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 0; Cin = 0; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 0; Cin = 1; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 1; Cin = 0; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 1; Cin = 1; #10;
    $display("%b  %b   %b   | %b   %b", A, B, Cin, S, Cout);

    $finish;
    
  end
endmodule
