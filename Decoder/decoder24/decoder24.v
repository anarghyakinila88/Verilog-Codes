module decoder2x4(a,b,en,y);
input a,b,en;
output [3:0]y;
wire an,en;
assign an=~a;
assign bn=~b;
assign y[0]=(en&an&bn);
assign y[1]=(en&an&b);
assign y[2]=(en&a&bn);
assign y[3]=(en&a&b);
endmodule
