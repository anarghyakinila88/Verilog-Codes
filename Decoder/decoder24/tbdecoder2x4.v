module tbdecoder2x4();
wire [3:0]y;
reg a,b,en;

decoder2x4 dut(a,b,en,y);

initial
begin
en=0;
a=1'bx;
b=1'bx;
#10
en=1;
{a,b}=0;
#10
{a,b}=1;
#10
{a,b}=2;
#10
{a,b}=3;
#10
$monitor ("a=%b ,b=%b ,en=%b ",a,b,en);

end
endmodule