	module decod4x16 (in, out);

	input [3:0] in;
	input en;
	output [15:0] out;

	always @ (en)
	begin
	 case (en)
		4'b0000: begin  out = 16'b0000000000000001;  end
		4'b0001: begin  out = 16'b0000000000000010;  end
		4'b0010: begin  out = 16'b0000000000000100;  end
		4'b0011: begin  out = 16'b0000000000001000;  end
		4'b0100: begin  out = 16'b0000000000010000;  end
		4'b0101: begin  out = 16'b0000000000100000;  end
		4'b0110: begin  out = 16'b0000000001000000;  end
		4'b0111: begin  out = 16'b0000000010000000;  end
		4'b1000: begin  out = 16'b0000000100000000;  end
		default: begin  out = 16'bxxxxxxxxxxxxxxxx;  end
	 endcase
	end
	
