module fifo#(parameter WIDTH = 8 , DEPTH = 16 , BIT = 4)(clk,rst,we,re,d_in,d_out,fifoempty,fifofull);
input clk,rst,we,re;
input [(WIDTH-1):0] d_in;
output reg [(WIDTH-1):0] d_out;
output reg fifoempty,fifofull;
integer i;
reg [(BIT):0] wp,rp;
reg [(WIDTH-1):0] mem [0:(DEPTH-1)];


always@(posedge clk)
begin
fifoempty = 1'b0;
fifofull = 1'b0;
if(wp == 'b0)
fifoempty = 1'b1;
if(wp == DEPTH)
fifofull = 1'b1;
end


always@(posedge clk)
begin
if(rst)
begin
for(i=0;i<DEPTH;i=i+1)
mem[i] <= 'b0;
d_out <= 'b0;
wp <= 'b0;
rp <= 'b0;
end
else
begin
if(we && !fifofull)
begin
mem[wp] = d_in;
wp = wp + 'b1;
end
if(re && !fifoempty)
begin
d_out = mem[rp];
rp = rp + 'b1;
end
end
end
endmodule
