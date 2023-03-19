module pri_en_behav_case(I,D);
input [7:0]I;
output reg [2:0]D;

always@(I)
begin
casex({I})
8'b00000001: D=3'b000;
8'b0000001x: D=3'b001;
8'b000001xx: D=3'b010;
8'b00001xxx: D=3'b011;
8'b0001xxxx: D=3'b100;
8'b001xxxxx: D=3'b101;
8'b01xxxxxx: D=3'b110;
8'b1xxxxxxx: D=3'b111;
default $monitor("idle");
endcase
end
endmodule