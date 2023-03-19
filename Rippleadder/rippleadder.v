module rippleadder(a,b,cin,sum,carry);
input [3:0] a,b;
input cin;
output [3:0] sum;
output carry;
wire c1,c2,c3;
fulladder f1(a[0],b[0],cin,sum[0],c1);
fulladder f2(a[1],b[1],c1,sum[1],c2);
fulladder f3(a[2],b[2],c2,sum[2],c3);
fulladder f4(a[3],b[3],c3,sum[3],carry);
endmodule


module fulladder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
assign sum=a^b^cin;
assign cout=((a&b)|(a&cin)|(b&cin));
endmodule
