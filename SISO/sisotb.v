module sisotb();
reg clk;
reg clear;
reg si;
wire so;
siso1 uut (.clk(clk), .clear(clear),.si(si),.so(so));
initial begin
$monitor($time ,"si=%b ,so=%b",si,so);
clk = 0;
clear = 0;
si = 0;
#5 clear=1'b1;
#5 clear=1'b0;
#10 si=1'b1;
#10 si=1'b0;
#10 si=1'b0;
#10 si=1'b1;
#10 si=1'b0;
#10 si=1'b1;
end
always #5 clk = ~clk;
initial #150 $stop;
endmodule