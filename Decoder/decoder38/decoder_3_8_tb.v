module decoder_3_8_tb();
reg [2:0]in;
reg en;
wire [7:0]y;
integer i;
decoder_3_8 dut(y,in,en);
initial
begin
in=3'b000;
en=1'b1;
end
initial 
begin
for(i=0;i<256;i=i+1)
begin
{in}=i;
#10;
end 
end
initial
$monitor("input %b %b output %b",in,en,y);
initial #100 $finish();
endmodule
