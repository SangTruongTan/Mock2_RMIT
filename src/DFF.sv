module DFFPort(
    PortIn,
    PortOut,
    Clk
);

input [16:0] PortIn;
input Clk;
output reg [16:0] PortOut;

always @ (posedge Clk) begin
    PortOut = PortIn;
end


endmodule
