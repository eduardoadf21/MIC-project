	module decod2x4 (dout,in0,in1);
	
	input in0, in1;
	output [3:0] dout;

	and (dout[0], ~in0, ~in1);
	and (dout[1], ~in0, in1);
	and (dout[2], in0, ~in1);
	and (dout[3], in0, in1);
	endmodule
