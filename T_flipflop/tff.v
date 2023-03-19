module t_ff(t,clk,rst,q,qbar);
input t,clk,rst;
output q,qbar;
wire d;
xor x1(d,t,qbar);
d_ff d1(d,clk,rst,q,qbar);
endmodule

module d_ff(din,clk,rst,q,qbar);
input din,clk,rst;
output q,qbar;
reg q;
always@(posedge clk or posedge rst)
begin
if(rst)
q=1'b0;
else
q<=din;
end
assign qbar=~q;
endmodule
