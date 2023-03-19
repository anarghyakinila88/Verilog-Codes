module siso1(clk,clear,si,so);
input clk,si,clear;
output so;
reg so;
reg [3:0] tmp;
always @(posedge clk )
begin
if (clear)
tmp <= 4'b0000;
else
begin
tmp <= tmp << 1;
tmp[0] <= si;
so = tmp[3];
end
end
endmodule
