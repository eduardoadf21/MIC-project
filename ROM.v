	module ROM (out,in);

	input [8:0] in;	
	output reg [35:0] out;

	always @ (in)
	begin
	 case(in)
		9'h000: out = 36'b000000010_000_00_000000_000000000_000_0000; 	
	 endcase	
	endmodule
