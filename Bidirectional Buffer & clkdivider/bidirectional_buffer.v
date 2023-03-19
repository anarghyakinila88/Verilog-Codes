module bidirectional_buffer (a,b,en);
	inout a,b;
	input en;
	
	bufif0 B1 (a,b,en);
	bufif1 B2 (b,a,en);
	
endmodule