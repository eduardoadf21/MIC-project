	module ula8bit (out,carryout,F0,F1,ENA,ENB,INVA,INC,A,B);

	input [7:0] A, B;
	input F0,F1,ENA,ENB,INVA,INC;
	output carryout;
	output [7:0] out;

	wire [6:0] cin_w;

	ula1bit ula0 (out[0],cin_w[0],F0,F1,ENA,ENB,INVA,INC,A[0],B[0]);
	ula1bit ula1 (out[1],cin_w[1],F0,F1,ENA,ENB,INVA,cin_w[0],A[1],B[1]);
	ula1bit ula2 (out[2],cin_w[2],F0,F1,ENA,ENB,INVA,cin_w[1],A[2],B[2]);
	ula1bit ula3 (out[3],cin_w[3],F0,F1,ENA,ENB,INVA,cin_w[2],A[3],B[3]);
	ula1bit ula4 (out[4],cin_w[4],F0,F1,ENA,ENB,INVA,cin_w[3],A[4],B[4]);
	ula1bit ula5 (out[5],cin_w[5],F0,F1,ENA,ENB,INVA,cin_w[4],A[5],B[5]);
	ula1bit ula6 (out[6],cin_w[6],F0,F1,ENA,ENB,INVA,cin_w[5],A[6],B[6]);
	ula1bit ula7 (out[7],carryout,F0,F1,ENA,ENB,INVA,cin_w[6],A[7],B[7]);
	endmodule
