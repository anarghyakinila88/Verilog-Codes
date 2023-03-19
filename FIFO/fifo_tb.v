module fifo_tb();
parameter WIDTH = 8 , DEPTH = 16 , BIT = 4 , CYCLE = 10;
reg clk,rst,we,re;
reg [(WIDTH-1):0] d_in;
wire [(WIDTH-1):0] d_out;
wire fifoempty,fifofull;
integer i,j;


fifo DUT(clk,rst,we,re,d_in,d_out,fifoempty,fifofull);

initial
begin
clk <= 1'b0;
rst <= 1'b0;
we  <= 1'b0;
re  <= 1'b0;
end

always
#(CYCLE/2) clk = ~clk;

task delay(input i);
#i;
endtask

task reset;
begin
@(negedge clk)
rst = 1'b1;
@(negedge clk)
rst = 1'b0;
end
endtask

task write([(WIDTH-1):0] data);
begin
@(negedge clk)
begin
we = 1'b1;
d_in = data;
end
@(negedge clk)
we = 1'b0;
end
endtask

task read;
begin
@(negedge clk)
begin
re = 1'b1;
end
@(negedge clk)
re = 1'b0;
end
endtask

initial
$monitor("time = %t , clk = %b , rst = %b , we = %b , re = %b , wp = %b , rp = %d , d_in = %b , d_out = %b , fifoempty = %b , fifofull = %b",$time,clk,rst,we,re,DUT.wp,DUT.rp,d_in,d_out,fifoempty,fifofull);



initial
begin
reset;
for(i=0;i<DEPTH;i=i+1)
write({$random} % 256);
for(j=0;j<DEPTH;j=j+1)
read;
delay(10);
$finish();
end


endmodule




