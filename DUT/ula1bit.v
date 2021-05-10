//figura 3.18 tanenbaum 
	module ula1bit (out,carryout,F0,F1,ENA,ENB,INVA,INC,A,B);
	input F0, F1, ENA, ENB, INVA, INC, A, B;
	output carryout, out;
	
	wire [3:0] enable_wire;
	wire wA, wB, sum, AandB, AorB, invB;
	wire [2:0] out_lu;
		
	assign wA = (A & ENA) ^ INVA;
	assign wB = (B & ENB);

	logic_unit lu (out_lu,enable_wire[2:0],wA,wB);
	fulladder fa (sum, carryout, INC,enable_wire[3], wA, wB);
	decod2x4 dec2x4 (enable_wire,F0,F1);	
	// saida 
	or (out, out_lu[0], out_lu[1], out_lu[2], sum);
	endmodule
