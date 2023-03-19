module tfftb();
wire q,qbar;
reg tin,clk,rst;
t_ff dut(tin,clk,rst,q,qbar);

initial
begin
clk=1'b0;
forever
#5
clk=~clk;
end

initial
begin
tin=1'b0;
rst=1'b1;
#10
tin=1'b1;
rst=1'b0;
#10
tin=1'b0;
#10
tin=1'b1;
$stop;
end
endmodule

