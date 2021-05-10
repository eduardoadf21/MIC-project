	module ula_bench();

	reg [31:0] A, B; 
	reg F0, F1, ENA, ENB, INVA, INC;
	wire [31:0] out;
	wire carryout;
	
	ula32bit DUT (out,carryout,F0,F1,ENA,ENB,INVA,INC,A,B);


	initial
	begin
		A = 32'hAAAAFAB2; B = 32'hBBBB13AB;
		$dumpfile ("dut.vcd"); $dumpvars (0,ula_bench);
		$monitor  ($time, "  %b%b%b%b%b%b  out = %h", F0,F1,ENA,ENB,INVA,INC,out);
 	end

	initial
	begin
		#10 F0=1'b0;F1=1'b1;ENA=1'b1;ENB=1'b0;INVA=1'b0;INC=1'b0;
		#10 F0=1'b0;F1=1'b1;ENA=1'b0;ENB=1'b1;INVA=1'b0;INC=1'b0;
		#10 F0=1'b0;F1=1'b1;ENA=1'b1;ENB=1'b0;INVA=1'b1;INC=1'b0;
		#10 F0=1'b1;F1=1'b0;ENA=1'b1;ENB=1'b1;INVA=1'b0;INC=1'b0;
		#10 F0=1'b1;F1=1'b1;ENA=1'b1;ENB=1'b1;INVA=1'b0;INC=1'b0;
		#10 F0=1'b1;F1=1'b1;ENA=1'b1;ENB=1'b1;INVA=1'b0;INC=1'b1;
		#10 F0=1'b1;F1=1'b1;ENA=1'b1;ENB=1'b0;INVA=1'b0;INC=1'b1;
		#10 F0=1'b1;F1=1'b1;ENA=1'b0;ENB=1'b1;INVA=1'b0;INC=1'b1;
		#10 F0=1'b1;F1=1'b1;ENA=1'b1;ENB=1'b1;INVA=1'b1;INC=1'b1;
		#10 F0=1'b1;F1=1'b1;ENA=1'b0;ENB=1'b1;INVA=1'b1;INC=1'b0;
		#10 F0=1'b1;F1=1'b1;ENA=1'b1;ENB=1'b0;INVA=1'b1;INC=1'b1;
		#10 F0=1'b0;F1=1'b0;ENA=1'b1;ENB=1'b1;INVA=1'b0;INC=1'b0;
		#10 F0=1'b0;F1=1'b1;ENA=1'b1;ENB=1'b1;INVA=1'b0;INC=1'b0;
		#10 F0=1'b0;F1=1'b1;ENA=1'b0;ENB=1'b0;INVA=1'b0;INC=1'b0;
		#10 F0=1'b1;F1=1'b1;ENA=1'b0;ENB=1'b0;INVA=1'b0;INC=1'b1;
		#10 F0=1'b1;F1=1'b1;ENA=1'b0;ENB=1'b0;INVA=1'b1;INC=1'b0;
	end
	endmodule
