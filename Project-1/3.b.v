`timescale 1ns / 1ps

module testbench;
  reg [15:0] A, B;
  reg Cin;
  wire [15:0] Sum;
  wire Cout;

  Prefix_Adder uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

  initial begin

    $dumpfile("waveform.vcd"); // VCD file for waveform
    $dumpvars(0, testbench);   // Dump all variables in testbench


    // Print header for clarity
    $display("A    B     Cin | Sum       Cout");
    $display("--------------------------------------------------------");

    // Test case 1: A = 0000, B = 0000, Cin = 0
    A = 16'h0000; B = 16'h0000; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    // Test case 2: A = 0001, B = 0001, Cin = 0
    A = 16'h0001; B = 16'h0001; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    // Test case 3: A = 0010, B = 0011, Cin = 0
    A = 16'h0010; B = 16'h0011; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    // Test case 4: A = 5555, B = AAAA, Cin = 0
    A = 16'h5555; B = 16'hAAAA; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    // Test case 5: A = FFFF, B = 0001, Cin = 0
    A = 16'hFFFF; B = 16'h0001; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    // Test case 6: A = FFFF, B = FFFF, Cin = 0
    A = 16'hFFFF; B = 16'hFFFF; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    // Test case 7: A = FFFF, B = FFFF, Cin = 1
    A = 16'hFFFF; B = 16'hFFFF; Cin = 1; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    // Test case 8: A = AAAA, B = CCCC, Cin = 1
    A = 16'hAAAA; B = 16'hCCCC; Cin = 1; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, Sum, Cout);

    $finish;
  end
endmodule
