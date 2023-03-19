module single_port_ram_tb();

wire [15:0]data;
reg [2:0]addr;
reg we,enable;
reg [15:0]temp;
integer l;
sport_ram dut(data,we,enable,addr);

assign data=(we && !enable)?temp:16'hzzz;
 
task initialize();
begin
we=1'b0;
enable=1'b0;
temp=16'h0;
end
endtask
task inputs(input [2:0]i,input [7:0]j);
begin
addr=i;
temp=j;
end
endtask
task write();
begin
we=1'b1;
enable=1'b0;
end
endtask
task read();
begin
we=1'b0;
enable=1'b1;
end
endtask

initial
begin
initialize;
#10;
write;
for(l=0;l<8;l=l+1)
begin
inputs(l,l);
#10;
end
initialize;
#10;
read;
for(l=0;l<8;l=l+1)
begin
inputs(l,l);
#10;
end
#10
$stop;
end
endmodule





















