module dual_port_ram_asyn(clk,rst,wr_data,we,wr_addr,re,rd_addr,rd_data);

parameter
ADDRESS_DEPTH=8,
DATA_WIDTH=16,
ADDRESS_SIZE=3;

input clk,rst,we,re;
input [(DATA_WIDTH-1):0] wr_data;
input [(ADDRESS_SIZE-1):0] wr_addr, rd_addr;
output  reg [(DATA_WIDTH-1):0] rd_data;
integer i;


reg [(DATA_WIDTH-1):0] mem [(ADDRESS_DEPTH-1):0];


always@(*)
begin
if(rst)
begin
rd_data<=0;
for(i=0;i<ADDRESS_DEPTH;i=i+1)
mem[i]=0;
end
else
begin
if(we)
mem[wr_addr]<=wr_data;
if (re)
rd_data<=mem[rd_addr];
end
end

endmodule
