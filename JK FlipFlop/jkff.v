module jk_ff(j,k,clk,rst,Q,Q_b);
input j,k,clk,rst;
output reg Q;
output Q_b;

parameter
HOLD=2'b00,
SET=2'b10,
RESET=2'b01,
TOGGLE=2'b11;


always@(posedge clk)
begin
case({j,k})
HOLD: Q<=Q;
SET: Q<=1'b1;
RESET: Q<=1'b0;
TOGGLE: Q<=~Q;
default Q=1'b0;
endcase
end

assign Q_b=~Q;


endmodule
