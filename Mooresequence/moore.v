module moore(x,clk,rst,z);
input x,clk,rst;
output z;
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg[1:0]ps,ns;
always@(posedge clk or posedge rst)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end
always@(ns,ps)
begin
     case(ps)
s0:begin
   if(x==1)
   ns<=s1;
   else
   ns<=s0;
 end
s1:begin
   if(x==1)
   ns<=s1;
   else
   ns<=s2;
 end
s2:begin
   if(x==1)
   ns<=s3;
   else
   ns<=s0;
 end
s3:begin
   if(x==1)
   ns<=s1;
   else
   ns<=s2;
 end
 endcase
 end
 assign z=(ps==s3);
endmodule
