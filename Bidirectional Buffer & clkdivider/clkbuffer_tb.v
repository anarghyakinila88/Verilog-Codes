module clkbuffer_tb();
wire d_out;
reg d_in;
time t1,t2,t3,t4;

clkbuffer DUT(d_out,d_in);

initial
d_in = 1'b0;

always 
#10 d_in = ~d_in;

task masterclktime;
begin
@(posedge d_in)
begin
t1 = $time;
$display("t1 = %t",t1);
end
@(posedge d_in)
begin
t2 = $time;
$display("t2 = %t",t2);
end
end
endtask

task delayclktime;
begin
@(posedge d_out)
begin
t3 = $time;
$display("t3 = %t",t3);
end
@(posedge d_out)
begin
t4 = $time;
$display("t4 = %t",t4);
end
end
endtask

task freqcheck;
begin
if((t2-t1) == (t4-t3))
$display("MASTER CLK & DELAY CLK ARE HAVING SAME FREQUENCY");
else
$display("MASTER CLK & DELAY CLK ARE NOT HAVING SAME FREQUENCY");
end
endtask

task phasecheck;
begin
if(t1 == t3)
$display("MASTER CLK & DELAY CLK ARE HAVING SAME PHASE");
else
$display("MASTER CLK & DELAY CLK ARE NOT HAVING SAME PHASE");
end
endtask

initial
fork
masterclktime;
delayclktime;
#50 freqcheck;
#80 phasecheck;
join

initial #100 $finish();

endmodule