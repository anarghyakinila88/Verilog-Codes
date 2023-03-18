module comp_n(x1,x2,comp_out);
parameter n=7;
input [n:0]x1,x2;
output reg [n:0]comp_out;
always@(x1 or x2)
begin
   if(x1>x2)
      comp_out=7'b0000001;
   else
      comp_out=7'b1000001;
end
endmodule
