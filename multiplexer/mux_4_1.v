module mux_4_1(a,b,c,d,s0,s1,y);
input wire a,b,c,d;
input wire s0,s1;
output reg y;
always@(*)
begin
case({s0,s1})
2'b00:y =a;
2'b01:y =b;
2'b10:y =c;
2'b11:y =d;
endcase
end
endmodule
