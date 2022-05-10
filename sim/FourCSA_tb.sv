module FourCSA_tb;

logic [7:0] A;
logic [7:0] B;
logic Cin;
wire [7:0] S;
wire Cout;

logic [7:0] ES;
logic ECout;
logic [25: 0] testVector[0 : 100];
logic [31 : 0] i;
logic clk;

FourCSA csa_1(.A(A),
              .B(B),
              .Cin(Cin),
              .S(S),
              .Cout(Cout));

initial begin
    i = 0;
    clk = 1'b1;
    $readmemh("FourCSA_tb_vector.txt", testVector);
end

always @ (posedge clk) begin
    {ECout, Cin, A, B, ES} = testVector[i];
end

always @(negedge clk) begin
    if(ES != S || ECout != Cout) begin
        $display("[time =%0t]Wrong Value: Instruction:%b", $time, {A, B, S});
    end
    i = i + 1;
end

always begin
    #25;
    clk = !clk;
end

endmodule
