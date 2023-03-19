module mod_12_loadable_counter_tb();
reg load,clk,rst;
reg [3:0] data;
wire [3:0] count;
integer i;

mod_12_counter DUT(clk,rst,load,data,count);

initial
begin
clk=1'b1;
forever
#5 clk=~clk;
end


task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task Load(input l, input [3:0] d);
begin
@(negedge clk)
load=l;
data=d;
end
endtask


initial 
begin
reset;
#100;
Load(1'b1,4'd6);
Load(1'b0,4'd6);
end

initial
$monitor("Load=%b,Data=%b,reset=%b Count=%b", load,data,rst,count);

initial
#300 $finish();

endmodule 
