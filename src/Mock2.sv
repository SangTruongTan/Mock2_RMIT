module Mock2(
    A,
    B,
    Cin,
    Clk,
    S,
    Cout
);

input [7:0] A;
input [7:0] B;
input Cin;
input Clk;

output reg [7:0] S;
output reg Cout;

wire [16:0] In;
wire [16:0] Out;

wire [7:0] wasteLine;
//DFF In
DFFPort dff_1(.PortIn({Cin, A, B}),
          .PortOut(In),
          .Clk(Clk));

//CSA
FourCSA csa_1(.A(In[15:8]),
              .B(In[7:0]),
              .Cin(In[16]),
              .S(Out[7:0]),
              .Cout(Out[8]));
//DFF Out
DFFPort dff_2(.PortIn(Out),
          .PortOut({wasteLine,Cout, S}),
          .Clk(Clk));

endmodule
