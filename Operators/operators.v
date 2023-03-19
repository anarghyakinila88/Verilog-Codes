module operators(a,b,c,x,y,z,x1,y1,z1,v1,w1,v2,w2,x2,y2,z2,a1,w3,x3,y3,z3,b1);
input [2:0]a,b,c;
output x,y,z;
output [2:0]x1,z1,y1,v1,w1;
output v2,w2,x2,y2,z2;
input [3:0]a1,b1;
output w3,x3,y3,z3;

/*initial 
begin*/
/*logical operators*/
/*assign a=5;
assign b=3'b111;
assign c='bx;*/
assign x=a && b;
assign y=a || b;
assign z= !b;
//$display("x=%b,Y=%b,z=%b",x,y,z);
/*bitwise operators*/
assign v1=a~^b;
assign w1=~a;
assign x1=a &b;
assign y1=a|b;
assign z1=a^c;
//$display("x1=%b,y1=%b,z1=%b,v1=%b,w1=%b",x1,y1,z1,v1,w1); 
/*reduction operators*/
assign v2=|a;
assign w2=&a;
assign x2=^a;
assign y2=~^a;
assign z2=~|a;
//$display("v2=%b, w2= %b,x2=%b,y2=%b,z2=%b",v2,w2,x2,y2,z2);
/* shift operators*/
/*assign a1=4'b1010;
assign b1=4'b1010;*/
assign w3=a1<<1;
assign x3=a1>>2;
assign y3=b1>>>1;
assign z3=b1<<<2;
/*$display(" w3=%b,x3=%b,y3=%b,z3=%b",w3,x3,y3,z3);
end*/
endmodule
