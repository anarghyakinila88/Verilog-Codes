module dual_port_ram_tb();

parameter
ADDRESS_DEPTH=16,
DATA_WIDTH=8,
ADDRESS_SIZE=4;

reg clk,rst,we,re;
reg [(DATA_WIDTH-1):0] wr_data;
reg [(ADDRESS_SIZE-1):0] wr_addr,rd_addr;
wire [(DATA_WIDTH-1):0] rd_data; 

dual_port_ram DUT(clk,rst,wr_data,we,wr_addr,re,rd_addr,rd_data);

initial
begin
clk=1'b1;
forever
#5 clk=~clk;
end

task initialize();
begin
we=1'b0;
re=1'b0;
end
endtask

task reset;
begin
@(negedge clk);
rst=1'b1;
@(negedge clk);
rst=1'b0;
end
endtask

task write(input [(DATA_WIDTH-1):0] a, input [(ADDRESS_SIZE-1):0] b, input c);
begin
@(negedge clk);
wr_data=a;
wr_addr=b;
we=c;
end
endtask

task read(input [(ADDRESS_SIZE-1):0] x, input y);
begin
@(negedge clk);
rd_addr=x;
re=y;
end
endtask

initial
begin
initialize;
reset;
#10;
write(8'b00001111,4'b0110,1'b1);
write(8'b00001111,4'b0110,1'b0);
#10;
read(4'b0110,1'b1);
end

initial
#200 $finish();

endmodule





