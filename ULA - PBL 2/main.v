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
	sub8bit_correto subtrator(bout, Ss, Data_A, Data_B, 1'b0);
	multiplicador_alternativo multiplicador(clk, not_executar, executar, Data_A, Data_B, Sm);
	divisor8bit divisor0(Sd, Data_A, Data_B);
	
	
	AND_operation and0(Sa, Data_A, Data_B);
	OR_operation or0(So, Data_A, Data_B);
	XOR_operation xor0(Sxor, Data_A, Data_B);
	NOT_operation not0(Snot, Data_A);
	//===================================================================
	
	//=======================Flags=======================================
	wire FlagZero_prev;
	overflow(bout, fioOverflow);
	FlagErro(Data_B, O, fioErro);
	CarryOut(S[8], fioCarry);
	muxFlag(FlagCarryOut, FlagOverflow, FlagErro, fioCarry, fioOverflow, fioErro, Ope, executar);
	FlagZero(mux[12:0], FlagZero_prev);
	and (FlagZero, FlagZero_prev, executar);
	
	wire [15:0]mux_prev;
	mux mux_main(S, Ss, Sm, Sd, Sa, So, Sxor, Snot, Ope, mux, executar);
	
	//===================Registrador do último resultado==========================
	wire register_pulse, clk_dividido, res, overflow_result_prev;
	
	overflow8bits(mux, overflow_result_prev);
	d_flipflop dff0 (.q(overflow_result), .d(overflow_result_prev), .reset(reset), .clk(register_pulse));
	
	dividir_5 div_clk (.clk(clk), .clk_out(clk_dividido));
	and gerar_pulso_reg (register_pulse, clk_dividido, executar);
	register_8bit(mux, register_pulse, last_result, reset);
	
	//============================================================================

	//===================Display==========================
	not(d6[0], executar);
	not(d6[1], executar);
	overflow12bits(mux, overflow_muitos_bits);
	display7seg(mux, sel_ope, d1, d2, d3, d4);
	//====================================================
	
endmodule
