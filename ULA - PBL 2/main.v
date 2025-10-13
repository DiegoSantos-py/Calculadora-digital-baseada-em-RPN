module main(A, Enable, clk, d1, d2, d3, d4, d5, d6, FlagCarryOut, FlagErro, FlagZero, FlagOverflow, sel_ope);

	input [7:0]A; // Entrada
	input [1:0]sel_ope;
	input Enable; // Enter
	input clk; // Clock padrao da FPGA
	output [6:0]d1, d2, d3, d4, d5, d6; // Displays
	output FlagCarryOut, FlagErro, FlagZero, FlagOverflow; // Flags
	
	wire [15:0] Sm;
	wire [8:0] S;
	wire [7:0] Ss, Sa, So, Sxor, Sd, Snot, last_result;
	wire [15:0]mux;
	wire fioOverflow, fioErro, fioCarry;
	wire bout;
	
	wire [7:0] Data_A, Data_B;
	wire [2:0] Ope; // guarda os bits de operaçao
	wire executar; //permite que a operaçao aconteça
	 
	//===================Shift register/debounce==========================
	top(
   .clk(clk),          
   .switch_in(Enable),    
   .data_in(A),
   .out1(Ope), .out2(Data_B), .out3(Data_A),
   .execute(executar));

	//=====================================================================
	
	////==================Operações========================================
	sum8bit somador(S[8], S, Data_A, Data_B);
	sub8bit subtrator(bout, Ss, Data_A, Data_B, 1'b0);
	//mult multiplicador(Sm, A, B, C);
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
	muxFlag(FlagCarryOut, FlagOverflow, FlagErro, fioCarry, fioOverflow, fioErro, O);
	FlagZero(mux, FlagZero);
	
	wire [15:0]mux_prev;
	mux mux_8bit(S, Ss, Sm, Sd, Sa, So, Sxor, Snot, Ope, mux);
	
	//===================Registrador do último resultado==========================
	wire register_pulse, clk_dividido;
	dividir_5 div_clk (.clk(clk), .clk_out(clk_dividido));
	and gerar_pulso_reg (register_pulse, clk_dividido, executar);
	register_8bit(mux, register_pulse, last_result, reset);
	//============================================================================
	
	// Trava a exibiçao do resultado ate que o operador seja incluido
   //and and_execute1(mux[0], mux_prev[0], executar);
   //and and_execute2(mux[1], mux_prev[1], executar);
	//and and_execute3(mux[2], mux_prev[2], executar);
	//and and_execute4(mux[3], mux_prev[3], executar);
	//and and_execute5(mux[4], mux_prev[4], executar);
   //and and_execute6(mux[5], mux_prev[5], executar);
	//and and_execute7(mux[6], mux_prev[6], executar);
	//and and_execute8(mux[7], mux_prev[7], executar);
	
	//===================Display==========================
	display7seg(mux, sel_ope, d1, d2, d3, d4, d5, d6);
	
	//====================================================
	

endmodule
