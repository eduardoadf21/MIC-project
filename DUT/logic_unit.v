	module logic_unit (out, en, A, B);
	input A, B;
	input [2:0] en;
	output [2:0] out;
	wire AandB, AorB, invB;

	and (AandB, A, B);
	or  (AorB, A, B);
	not (invB, B);

	and (out[0], AandB, en[0]);
	and (out[1], AorB, en[1]);
	and (out[2], invB, en[2]);
	endmodule
