module tbstructadder();
wire sum,cout;
reg a,b,cin;
structadder dut(a,b,cin,sum,carry);
initial
begin
{a,b,cin}=0;
#10
{a,b,cin}=1;
#10
{a,b,cin}=2;
#10
{a,b,cin}=3;
#10
{a,b,cin}=4;
#10
{a,b,cin}=5;
#10
{a,b,cin}=6;
#10
{a,b,cin}=7;
#10
$monitor ( "a=%b , b=%b ,sum=%b, carry=%b",a,b,cin,sum,carry);

end
endmodule