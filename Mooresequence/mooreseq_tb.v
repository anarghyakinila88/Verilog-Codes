module mooreseq_tb();

reg clk;
reg rst;
reg x;
wire y;

moore DUT(clk,rst,x,y);

initial
begin
	
clk=0;
rst=0;
x=0;	
#10
rst=1;
#10
rst=0;
#10
x=0;
#10
x=1;
#10
x=0;
#10
x=1;
#10
x=0;
end
always #5 clk=~clk;

endmodule



