	module ula32bit (out,carryout,F0,F1,ENA,ENB,INVA,INC,A,B);

	input [31:0] A, B;
	input F0,F1,ENA,ENB,INVA,INC;
//	input [5:0] ulactrl; ??
	output carryout;
	output [31:0] out;
	
	wire [3:0] cin_w; 

	ula8bit ula0 (out[7:0],cin_w[0],F0,F1,ENA,ENB,INVA,INC,A[7:0],B[7:0]);
	ula8bit ula8 (out[15:8],cin_w[1],F0,F1,ENA,ENB,INVA,cin_w[0],A[15:8],B[15:8]);
	ula8bit ula16 (out[23:16],cin_w[2],F0,F1,ENA,ENB,INVA,cin_w[1],A[23:16],B[23:16]);
	ula8bit ula24 (out[31:24],carryout,F0,F1,ENA,ENB,INVA,cin_w[2],A[31:24],B[31:24]);
	endmodule
