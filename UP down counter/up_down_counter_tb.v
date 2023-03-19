module up_down_counter_tb();
reg load,clk,rst,ctrl;
reg [3:0] data;
wire [3:0] count;
integer i,m;

up_down_counter DUT(clk,rst,ctrl,load,data,count);

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

task Load(input l, input c, input [3:0] d);
begin
@(negedge clk)
load=l;
data=d;
ctrl=c;
end
endtask



initial 
begin
reset;
Load(1'b0,1'b0,4'dx);
#100;
Load(1'b1,1'b0,4'd6);
Load(1'b0,1'b0,4'd6);
#100;
Load(1'b1,1'b1,4'd5);
Load(1'b0,1'b1,4'd5);

end



initial
$monitor("Load=%b Control=%b Data=%b,reset=%b Count=%b", load,ctrl,data,rst,count);

initial
#500 $finish();

endmodule 
