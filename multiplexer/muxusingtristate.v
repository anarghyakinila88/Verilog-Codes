module tristate(input oe,input a,
output reg y);
always @(*)
begin
case (oe)
0 : y = 1'bZ;
1 : y = a;
endcase
end
endmodule