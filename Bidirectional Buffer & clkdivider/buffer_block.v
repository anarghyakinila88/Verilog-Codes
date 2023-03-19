module buffer_block(diff,enable, buf_out);
parameter n=7;
input [n:0]diff;
input enable;
output [n:0]buf_out;
assign buf_out=enable?diff:'bz;
endmodule