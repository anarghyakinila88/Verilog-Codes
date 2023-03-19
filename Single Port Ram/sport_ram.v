module sport_ram(data,we,enable,addr);
input we,enable;
inout [15:0]data;
input [2:0]addr;

reg [15:0] mem[7:0];

always@(*)
if(we && !enable)
mem[addr]=data;

assign data=(enable && !we)?mem[addr]:16'hzz;
endmodule
