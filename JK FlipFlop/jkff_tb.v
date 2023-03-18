module jk_ff_tb();
reg j,k,clk,rst;
wire Q,Q_b;

jk_ff DUT(j,k,clk,rst,Q,Q_b);

initial 
begin
clk=1'b1;
forever
#5 clk=~clk;
end

task initialize;
begin
j=1'b0;
k=1'b0;
rst=1'b1;
end
endtask

task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task inputs(input x,y);
begin
@(negedge clk)
j=x;
k=y;
end
endtask

initial 
begin
initialize;
reset;
inputs(1'b0,1'b0);
#10;
inputs(1'b0,1'b1);
#10;
inputs(1'b1,1'b0);
#10;
inputs(1'b1,1'b1);
#10;
end

initial
$monitor("Inputs Reset=%b J=%b K=%b Output Q=%b Q'=%b", rst,j,k,Q,Q_b);

initial #200 $finish();

endmodule
