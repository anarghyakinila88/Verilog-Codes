module d_ff(d_in,clk,rst,Q_out,Qb_out);
input d_in,clk,rst;
output reg Q_out;
output reg Qb_out;

always@(posedge clk)
begin 
Qb_out=~Q_out;
if(rst)
Q_out=1'b0;
else
Q_out<=d_in;
end

endmodule
