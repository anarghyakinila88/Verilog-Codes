module up_down_counter(clk,rst,ctrl,load,data,count);
input clk,rst,load,ctrl;
input [3:0] data;
output reg [3:0] count;

always@(posedge clk)
begin
if(rst)
count<=4'd0;
else if (load)
count<=data;
else
case(ctrl)
1'b0: count<=count+1;
1'b1: count<=count-1;
endcase

end


endmodule
