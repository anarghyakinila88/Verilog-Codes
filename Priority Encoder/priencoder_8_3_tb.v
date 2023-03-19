module priencoder_8_3_tb(); 
reg [7:0]I; 
 
wire [2:0]D; 
integer i; 
pri_en_behav_case dut(I,D); 
initial 
I=8'b00000000;   
initial 
begin 
for(i=0;i<256;i=i+1)
begin 
        #10
	{I}=i; 
	end
 end
initial 
$monitor("input %b  output %b",I,D);  
endmodule
