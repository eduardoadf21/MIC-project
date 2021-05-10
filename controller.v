	module controller (clk, );

	wire [8:0] addr;
	wire [2:0] jam;
	wire [7:0] alu;
	wire [8:0] C;
	wire [2:0] mem;
	wire [3:0] B;
	wire [35:0] wMIR;	
	wire [8:0] MPC;

	
	ROM control_store (wMIR,MPC);	
	MIR microinstr ({addr,jam,alu,C,mem,B},clk,wMIR);	

	always @ (posedge clk)
	

	endmodule
