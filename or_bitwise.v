	module or_bitwise(f, a, b);
	
	parameter N = 8;
	
	input  [N-1:0] a, b;
	output [N-1:0] f;

	genvar p; // variable used only for generate statement
	generate for (p=0; p<N; p=p+1) 
			begin : orlp   
				or OG (f[p], a[p], b[p]);
			end
	endgenerate
	endmodule
