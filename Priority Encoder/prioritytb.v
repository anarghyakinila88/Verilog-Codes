module prioritytb;
  reg en;
  reg [7:0]i;
  wire [2:0]y;


  priorityencoder dut(i,en,y);
  initial
    begin

      
      $monitor("en=%b i=%b y=%b",en,i,y);
     
      en=1;i=127;#5
      en=1;i=63;#5
      en=1;i=31;#5
      en=1;i=15;#5
      en=1;i=6;#5
      en=1;i=3;#5
      en=1;i=2;#5
      en=1;i=1;#5
      en=0;i=8'bx;#5
	  $stop;
	  end
	  endmodule
	  
	  
	  