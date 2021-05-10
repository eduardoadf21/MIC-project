	module teste_shifter();
	
	reg [31:0] in;
	reg sll8, sra1;
	wire [31:0] out;
	

	shifter DUT (out, sll8, sra1, in);

	initial
	begin
		$dumpvars (0,teste_shifter);
		$monitor ($time, "input: %b  sll8: %b  sra1: %b  output: %b", in, sll8, sra1, out);
	end

	initial
	begin
		#10 in = 32'hA123FAB2; sll8 = 1'b0; sra1 = 1'b1;
		#10 in = 32'hB125FFFF; sll8 = 1'b1; sra1 = 1'b0;
		#10 in = 32'h0034AAAA; sll8 = 1'b0; sra1 = 1'b0;
		#10 in = 32'h3342BB21; sll8 = 1'b1; sra1 = 1'b0;
		#10 in = 31'h1111; sll8 = 1'b0; sra1 = 1'b1;
	end
	endmodule

