module srlatchtb();
reg S,R;
wire Q,Q_b;

srlatch DUT(S,R,Q,Q_b);

initial
begin
S=1'b0;
R=1'b0;
#10;
S=1'b0;
R=1'b1;
#10;
S=1'b1;
R=1'b0;
#10;
S=1'b1;
R=1'b1;
#10;
$stop;
end

initial
$monitor("Inputs S=%b R=%b Outputs Q=%b Q'=%b", S,R,Q,Q_b);



endmodule