module tbrippleadder();
wire [3:0] sum;
wire carry;
reg [3:0]a,b;
reg cin;
rippleadder dut (a,b,cin,sum,carry);

initial
begin 
a=4'b0;
b=4'b0;
cin=1'b0;
#10
a=4'b0101;
b=4'b1100;
cin=1'b1;
#20 $stop;
end
endmodule