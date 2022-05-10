module FourCSA(
    A,
    B,
    Cin,
    S,
    Cout
);

input [7:0] A;
input [7:0] B;
input Cin;
output reg [7:0] S;
output reg Cout;

wire C1;
wire C2;
wire C3;
wire C4;
wire Cin2;
wire Cin3;

//RCA block 1
TwoRCA RCA_1(.A(A[1:0]),
             .B(B[1:0]),
             .Cin(Cin),
             .S(S[1:0]),
             .Cout(C1));

//RCA block 2
TwoRCA RCA_2(.A(A[3:2]),
             .B(B[3:2]),
             .Cin(C1),
             .S(S[3:2]),
             .Cout(C2));

SkipAdder skip_1(.A0(A[2]),
                 .A1(A[3]),
                 .B0(B[2]),
                 .B1(B[3]),
                 .C0(C1),
                 .C1(C2),
                 .Cout(Cin2));

//RCA block 3
TwoRCA RCA_3(.A(A[5:4]),
             .B(B[5:4]),
             .Cin(Cin2),
             .S(S[5:4]),
             .Cout(C3));

SkipAdder skip_2(.A0(A[4]),
                 .A1(A[5]),
                 .B0(B[4]),
                 .B1(B[5]),
                 .C0(Cin2),
                 .C1(C3),
                 .Cout(Cin3));

//RCA block
TwoRCA RCA_4(.A(A[7:6]),
             .B(B[7:6]),
             .Cin(Cin3),
             .S(S[7:6]),
             .Cout(C4));

SkipAdder skip_3(.A0(A[6]),
                 .A1(A[7]),
                 .B0(B[6]),
                 .B1(B[7]),
                 .C0(Cin3),
                 .C1(C4),
                 .Cout(Cout));
endmodule

module SkipAdder(
    A0,
    A1,
    B0,
    B1,
    C0,
    C1,
    Cout
);

input A0;
input A1;
input B0;
input B1;
input C0;
input C1;

output reg Cout;

wire P0;
wire P1;
wire x1;
wire x2;


xor xor_1(P0, A0, B0);
xor xor_2(P1, A1, B1);
and and_1(x1, P0, P1);
and and_2(x2, x1, C0);
or or_1(Cout, x2, C1);

endmodule
