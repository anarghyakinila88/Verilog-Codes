module tbmux4x1();
wire y;
reg i0,i1,i2,i3,s0,s1;

mux4x1 dut(i0,i1,i2,i3,s0,s1,y);
 
 initial 
 begin
 {i0,i1,i2,i3} = 4'b1010;
 {s1,s0}=2'b00;
 #10
 {s1,s0}=2'b01;
 #10
 {s1,s0}=2'b10;
 #10
 {s1,s0}=2'b11;
 #10
 
 $monitor(" s0=%b ,s1=%b ,y=%b",s0,s1,y);
 $stop;
 end
 endmodule
 