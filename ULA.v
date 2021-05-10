	module ULA (outULA, ctrlULA, N, Z, A, busB);

	input [5:0] ctrlULA;
	input [31:0] A, BusB;
	output N, Z; // ?	
	// N=1'b1 se operaçao feita na ULA resultar em negativo
	// Z=1'b1 se operaçao feita na ULA resultar em zero 
	output [31:0] outULA;

	parameter INC=3'b000,INVA=3'b001,ENB=3'b010,ENA=3'b011,F1=3'b100,F0=3'b101;
	

	ula32bit ula (outULA,  , ctrlULA[F0], ctrlULA[F1], ctrlULA[ENA], ctrlULA[ENB] , ctrlULA[INVA], ctrlULA[INC], A, BusB);

	endmodule
