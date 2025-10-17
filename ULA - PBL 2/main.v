module main(A, Enable, clk, d1, d2, d3, d4, FlagCarryOut, FlagErro, FlagZero, FlagOverflow, sel_ope, last_operation, overflow_result, overflow_muitos_bits, d6);

	input [7:0]A; // Entrada
	input [1:0]sel_ope;
	input Enable; // Enter
	input clk; // Clock padrao da FPGA
	input last_operation;
	output [6:0]d1, d2, d3, d4; // Displays
	output [1:0] d6;
	output FlagCarryOut, FlagErro, FlagZero, FlagOverflow, overflow_result, overflow_muitos_bits; // Flags
	
	wire [15:0] Sm;
	wire [8:0] S;
	wire [7:0] Ss, Sa, So, Sxor, Sd, Snot, last_result;
	wire [15:0]mux;
	wire fioOverflow, fioErro, fioCarry;
	wire bout;
	
	wire [7:0] Data_A, Data_B, Data_in;
	wire [2:0] Ope; // guarda os bits de operaçao
	wire executar, not_executar; //permite que a operaçao aconteça
	 
	//===================Shift register/debounce==========================
	// Escolhe se o valor da última operação será usado
	mux_register mux_last_operation(Data_in, A, last_result, last_operation); 
	
	top(
   .clk(clk),          
   .switch_in(Enable),    
   .data_in(Data_in),
   .out1(Ope), .out2(Data_B), .out3(Data_A),
   .execute(executar));

	//=====================================================================
	
	////==================Operações========================================
	not(not_executar, executar);
	
	sum8bit somador(S[8], S[7:0], Data_A, Data_B);
	sub8bit subtrator(bout, Ss, Data_A, Data_B, 1'b0);
	multiplicador_alternativo multiplicador(clk, not_executar, executar, A, B, Sm);
	divisor8bit divisor0(Sd, Data_A, Data_B);
	
	
	AND_operation and0(Sa, Data_A, Data_B);
	OR_operation or0(So, Data_A, Data_B);
	XOR_operation xor0(Sxor, Data_A, Data_B);
	NOT_operation not0(Snot, Data_A);
	//===================================================================
	
	//=======================Flags=======================================
	overflow(bout, fioOverflow);
	FlagErro(Data_B, O, fioErro);
	CarryOut(S[8], fioCarry);
	muxFlag(FlagCarryOut, FlagOverflow, FlagErro, fioCarry, fioOverflow, fioErro, O, executar);
	FlagZero(mux[12:0], FlagZero);
	
	wire [15:0]mux_prev;
	mux mux_8bit(S, Ss, Sm, Sd, Sa, So, Sxor, Snot, Ope, mux_prev);
	
	//===================Registrador do último resultado==========================
	wire register_pulse, clk_dividido, res;
	
	overflow8bits(mux, overflow_result);
	mux_register(res, mux[7:0], 8'b11111111, overflow_result);
	
	dividir_5 div_clk (.clk(clk), .clk_out(clk_dividido));
	and gerar_pulso_reg (register_pulse, clk_dividido, executar);
	register_8bit(res, register_pulse, last_result, reset);
	
	//============================================================================
	
	// Trava a exibiçao do resultado ate que o operador seja incluido
   and and_execute1(mux[0], mux_prev[0], executar);
   and and_execute2(mux[1], mux_prev[1], executar);
	and and_execute3(mux[2], mux_prev[2], executar);
	and and_execute4(mux[3], mux_prev[3], executar);
	and and_execute5(mux[4], mux_prev[4], executar);
   and and_execute6(mux[5], mux_prev[5], executar);
	and and_execute7(mux[6], mux_prev[6], executar);
	and and_execute8(mux[7], mux_prev[7], executar);
	
	 //display_decimal({mux}, {d4[6], d4[5], d4[4], d4[3], d4[2], d4[1], d4[0],
	 //d3[6], d3[5], d3[4], d3[3], d3[2], d3[1], d3[0],
	 //d2[6], d2[5], d2[4], d2[3], d2[2], d2[1], d2[0],
	 //d1[6], d1[5], d1[4], d1[3], d1[2], d1[1], d1[0]});

	//===================Display==========================
	not(d6[0], executar);
	not(d6[1], executar);
	overflow12bits(mux, overflow_muitos_bits);
	display7seg(mux, sel_ope, d1, d2, d3, d4);
	//====================================================
	

endmodule
