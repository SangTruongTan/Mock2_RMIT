module TwoRCA(
    A,
    B,
    Cin,
    S,
    Cout
);

input [1:0] A;
input [1:0] B;
input Cin;
output reg [1:0] S;
output reg Cout;

wire Cout1;

//Fulladder low order
full_adder full1(.a(A[0]),
                 .b(B[0]),
                 .cin(Cin),
                 .sum(S[0]),
                 .cout(Cout1));
//Fulladder high order
full_adder full2(.a(A[1]),
                 .b(B[1]),
                 .cin(Cout1),
                 .sum(S[1]),
                 .cout(Cout));
endmodule

/////////////////////
//1bit Full Adder
/////////////////////
module full_adder(a,b,cin,sum, cout);
input a,b,cin;
output sum, cout;
wire x,y,z;
half_adder h1(.a(a), .b(b), .sum(x), .cout(y));
half_adder h2(.a(x), .b(cin), .sum(sum), .cout(z));
or or_1(cout,z,y);
endmodule

//////////////////////
// 1 bit Half Adder
//////////////////////
module half_adder( a,b, sum, cout );
input a,b;
output sum, cout;
xor xor_1 (sum,a,b);
and and_1 (cout,a,b);
endmodule
