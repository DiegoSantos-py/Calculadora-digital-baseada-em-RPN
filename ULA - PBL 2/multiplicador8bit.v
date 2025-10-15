module multiplicador(A, B, out, start, clk);
	input [7:0] A, B;
	input start, clk;
	output [15:0] out;
	
	wire [15:0] res_prev;
	wire [7:0] cont; // Bits do contador
	wire Cout;

	
	sum16bit sum_mult(Cout, res_prev, {8'b00000000, A}, out, 1'b0);
	register_16bit reg_mult(res_prev, en, out, reset); // Definir reset e sinal de enable
	
	contador_mod255 cont_mult(en, reset, cont[0], cont[1], cont[2], cont[3], cont[4], cont[5], cont[6], cont[7]);// Definir reset e sinal de enable
	comparador_8bit comp_mult(equal,A,B);

endmodule