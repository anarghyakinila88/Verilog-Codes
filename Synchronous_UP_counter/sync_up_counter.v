module sync_up_counter(clk,rst,load,data,count);
input clk,rst,load;
input [3:0] data;
output reg [3:0] count;

always@(posedge clk)
begin
if(rst)
count<=4'd0;
else if (load)
count<=data;
else if(count==4'd15)
count<=4'd0;
else
count<=count+1'b1;
end


endmodule
