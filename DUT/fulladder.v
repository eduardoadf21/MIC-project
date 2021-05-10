	module fulladder (sum,cout,cin,ena,A,B);
	input A, B, cin, ena;
	output cout, sum;

	wire t1, t2, t3, t4;

	xor (t1, A, B);
	xor (t2, t1, cin);
	and (t3, ena, A, B);
	and (t4, ena, t1, cin);
	or  (cout, t3, t4);
	and (sum, t2, ena);
	endmodule
