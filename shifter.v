	module shifter (out, sll8, sra1, in);

	input [31:0] in;
	input sll8, sra1;
	output reg [31:0] out;

	always @ (in or sll8 or sra1)
	begin
	 if (sll8) out <= in << 8; //shifts left by 1 byte
							   //filling the 8 least significant bits with zeros

	 if (sra1) out <= in >>> 1;//shifts right by 1 bit
							   //leaving the most significant unchanged

	 if (~sll8 & ~sra1) out <= in;
	end
	endmodule	
