module priorityencoder(i,en,y);
input en;
input [7:0]i;
output [2:0]y;
wire a1,a2,a3,a4,a5;

and o1 (a1,~i[6],~i[4],~i[2],i[1],en);
and o2 (a2,~i[6],~i[4],i[3],en);
and o3 (a3,~i[6],i[5],en);
and o4 (a4,~i[5],~i[4],i[2],en);
and o5 (a5,~i[5],~i[4],i[3],en);
or or1 (y[0],a1,a2,a3,i[7]);
or or2 (y[1],a4,a5,i[6],i[7]);
or or3 (y[2],i[4],i[5],i[6],i[7]);
endmodule
