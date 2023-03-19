module tb_bibuffer();
wire a,b;
reg en;
reg tempa,tempb;
bibuffer DUT (a,b,en);

initial
begin
tempa = 1'b0;
tempb = 1'b0;
en = 1'b0;
end

always #10 tempa = ~tempa;
always #20 tempb = ~tempb;
always #40 en = ~en;

assign a = (en) ? tempa : 1'bz;
assign b = (!en) ? tempb : 1'bz;

initial $monitor(" A=%b ,B=%b ,en=%b",a,b,en);
initial #200 $finish;
endmodule
