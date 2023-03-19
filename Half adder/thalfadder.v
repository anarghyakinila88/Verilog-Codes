module thalfadder();
wire sum,carry;
reg a,b;
halfadder dut(.a(a),.b(b),.sum(sum),.carry(carry));

initial
begin 

{a,b}=0;
#10
{a,b}=1;
#10
{a,b}=2;
#10
{a,b}=3;
#10
$monitor ( "a=%b , b=%b ,sum=%b, carry=%b",a,b,sum,carry);
$finish;
end

endmodule

