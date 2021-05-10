	module PIPO (dout, clk, read, write, din);
	
	input [31:0] din;
	input clk, read, write;
	output reg [31:0] dout;


	always @ (posedge clk and negedge read)
	begin
	 if (write)  dout <= din;
	end
	endmodule
