module muxusingdecoder(i0,i1,i2,i3,s0,s1,out);
input i0,i1,i2,i3,s0,s1;
output out;
wire [3:0]o;
decoder2x4 d1(s1,s0,1'b1,o);
tristate t1(o[0],i0,out);
tristate t2(o[1],i1,out);
tristate t3(o[2],i2,out);
tristate t4(o[3],i3,out);

endmodule



module tristate(input oe,input a,output reg y);
always @(*)
begin
case (oe)
0 : y = 1'bZ;
1 : y = a;
endcase
end
endmodule


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



