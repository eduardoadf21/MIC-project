	module MIR (out,clk,in);	
	input [35:0] in;
	output reg [35:0] out;
	input clk;

	always @ (posedge clk)
	begin
	 out <= in;
	end
	endmodule

			
