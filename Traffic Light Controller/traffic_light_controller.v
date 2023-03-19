module Traffic_Light_Controller(clk,reset,Red,Yellow,Green);
input clk,reset;
output reg Red,Yellow,Green;
reg [3:0]count;
reg [1:0]ps;
parameter [1:0] s0=2'b00,s1=2'b01,s2=2'b10;

always@(posedge clk)
begin
if(reset)
count<=4'b0000;
else 
count<=count+1;
case(ps)
s0:if(count==3)
   begin 
	ps<=s1;
	{Red,Yellow,Green}<=3'b100;
	end
s1:if(count==5) 
   begin
	ps<=s2;
	{Red,Yellow,Green}<=3'b010;
	end
s2:if(count==10) 
   begin 
	ps<=s0;
	count<=4'b0000;
	{Red,Yellow,Green}<=3'b001;
	end
default:begin
        {Red,Yellow,Green}<=3'b100;
		  ps<=s0;
		  end
endcase
end
endmodule 
