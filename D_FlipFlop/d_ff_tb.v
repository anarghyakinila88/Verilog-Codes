module d_ff_tb();
reg d_in,clk,rst;
wire Q_out,Qb_out;

d_ff DUT(d_in,clk,rst,Q_out,Qb_out);

initial 
begin
clk=1'b1;
forever
#5 clk=~clk;
end

task initialize;
begin
d_in=1'b0;
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

task inputs(input x);
begin
@(negedge clk)
d_in=x;
end
endtask

initial 
begin
initialize;
reset;
inputs(1'b0);
#10;
inputs(1'b1);
#10;
end

initial
$monitor("Inputs Reset=%b D=%b Output Q=%b", rst,d_in,Q_out);

initial #200 $finish();

endmodule
