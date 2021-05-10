	module mic_datapath(Addr,J,ULA_ctrl,C,M,B);
	//contains the ALU, its inputs and outputs
	//it is possible to read and write the same register in one cyle

	input [8:0] Addr;
	input [2:0] J;
	input [7:0] ULA_ctrl; // controls ULA and shifter
	input [8:0] C; // to select who will be written by busC 
	input [2:0] Mem;
	input [3:0] B; // to decode who will B bus read

	wire [16:0] readtoB;	
	wire [31:0] busB, busC, A, outULA;
	wire N, Z, out_bitalto;	

	// memory control registers
//  controls 32-bit word-adressable memory port
//  reads and write ISA-level data words
	MAR (busB[:2]); // nao tem saida pro barramento B
			// MAR[0] is wired to busC[2] 
	MDR (readtoB[0]); 
//--------
		
//  read executable ISA-level program (a byte stream)
	PC  (readtoB[1]); //guarda o endereço da prox instruçao
					  //controls 8-bit, byte adressable memory port	
	MBR (readtoB[2:3)); //can be copied signed or unsigned 
//		
	
	PIPO SP  (busB, clk, readtoB[4], wrSP, busC);   
	PIPO LV  (busB, clk, readtoB[5], wrLV, busC);   
	PIPO CPP (busB, clk, readtoB[6], wrCPP, busC);   
	PIPO TOS (busB, clk, readtoB[7], wrTOS, busC);   
	PIPO OPC (busB, clk, readtoB[8], wrOPC, busC);   
	PIPO H 	 (A, clk, ldH, busC);   

	decod4x16 enable_busB (B, readtoB); 

	bit_alto (j[0], j[1], N, Z, out_bitalto);
	

	ULA (outULA, ULA_ctrl[5:0], N, Z, A, busB);

	SHIFT shifter (busC, ULA_ctrl[7], ULA_ctrl[6], outULA);

	endmodule
