R/ calcular bit_alto
// saida faz operação OR com bit de ordem alta de MPC
// 
	module bit_alto(jamz, jamn, z, n, saida);

	input jamz, jamn, z, n;
	output saida;

	assign saida = (jamz & z) | (jamn & n);
		
	endmodule
