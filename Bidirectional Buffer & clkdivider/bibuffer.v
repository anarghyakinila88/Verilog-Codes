module bibuffer(a,b,ctrl);
inout a,b;
input ctrl;
bufif1 d1(b,a,ctrl);
bufif0 d2(a,b,ctrl);
endmodule
