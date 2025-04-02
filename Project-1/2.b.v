`timescale 1ns / 1ps

module testbench;
  reg [31:0] A, B;
  reg Cin;
  wire [31:0] S;
  wire Cout;

  CLA_32bit uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

  initial begin

    $dumpfile("waveform.vcd"); // VCD file for waveform
    $dumpvars(0, testbench);   // Dump all variables in testbench


    // Print header for clarity
    $display("A         	B        Cin | S       Cout");
    $display("--------------------------------------------------------------------------------");

    // Test case 1: A = 00000000000000000000000000000000, B = 00000000000000000000000000000000, Cin = 0
    A = 32'h00000000; B = 32'h00000000; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    // Test case 2: A = 00000001, B = 00000001, Cin = 0
    A = 32'h00000001; B = 32'h00000001; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    // Test case 3: A = 00000010, B = 00000011, Cin = 0
    A = 32'h00000010; B = 32'h00000011; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    // Test case 4: A = 55555555, B = AAAAAAAA, Cin = 0
    A = 32'h55555555; B = 32'hAAAAAAAA; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    // Test case 5: A = FFFFFFFF, B = 00000001, Cin = 0
    A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    // Test case 6: A = FFFFFFFF, B = FFFFFFFF, Cin = 0
    A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; Cin = 0; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    // Test case 7: A = FFFFFFFF, B = FFFFFFFF, Cin = 1
    A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; Cin = 1; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    // Test case 8: A = AAAAAAAA, B = CCCCCCCC, Cin = 1
    A = 32'hAAAAAAAA; B = 32'hCCCCCCCC; Cin = 1; #10;
    $display("%h  %h   %b   | %h  %b", A, B, Cin, S, Cout);

    $finish;
  end
endmodule
