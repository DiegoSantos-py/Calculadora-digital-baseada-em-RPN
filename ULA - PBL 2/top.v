module top(
    input clk,          // clock interno da FPGA (ex.: 50 MHz)
    input switch_in,    // switch físico para inserir valores
    input [7:0] data_in, // dados de entrada para o shift register
	 output [7:0] d1, d2, d3, d4, d5, d6,
    output execute);
	 
	 wire [7:0] out1, out2, out3;
    wire pulse_en;  // pulso único do debouncer

    // ===== Debouncer do switch =====
    switch_debouncer deb(
        .clk(clk),
		  .reset(1'b0),
        .botao_raw(switch_in),
        .botao_ok(pulse_en)   // pulso único, seguro como enable
    );

    // ===== Shift register =====
    shift_register sr(
        .in(data_in),
        .en(pulse_en),     // enable vindo do debouncer
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .execute(execute),
    );

	 
	displayunidade(out3, d1[0], d1[1], d1[2], d1[3], d1[4], d1[5], d1[6]); 
	displaydezena(out3, d2[0], d2[1], d2[2], d2[3], d2[4], d2[5], d2[6]); 
	
	displayunidade(out2, d3[0], d3[1], d3[2], d3[3], d3[4], d3[5], d3[6]); 
	displaydezena(out2, d4[0], d4[1], d4[2], d4[3], d4[4], d4[5], d4[6]); 
	
	displayunidade(out1, d5[0], d5[1], d5[2], d5[3], d5[4], d5[5], d5[6]); 
	displaydezena(out1, d6[0], d6[1], d6[2], d6[3], d6[4], d6[5], d6[6]); 
endmodule


module pbl(A, B, C, O, d1, d2, FlagCarryOut, FlagErro, FlagZero, FlagOverflow);

	input [3:0]A, B; // Entradas A e B
	input [2:0]O; // Operador
	input C; // Carry
	output [6:0]d1, d2; // Displays
	output FlagCarryOut, FlagErro, FlagZero, FlagOverflow; // Flags
	
	
	wire [2:0]Carry;
	wire [7:0] S, Ss, Sm, Sa, So, Sxor, Sd;
	wire [7:0]mux;
	wire fioOverflow, fioErro, fioCarry;
	wire bout;
	
	// Operações
	sum4bit somador(S[4], S, A, B, C);
	sub4bit subtrator(Ss, A, B, C, bout);
	mult multiplicador(Sm, A, B, C);
	divisor divisor0(Sd, A, B, C);
	cAND and0(Sa, A, B, C);
	cOR or0(So, A, B, C);
	cXOR xor0(Sxor, A, B, C);
	
	// Flags
	overflow(bout, fioOverflow);
	FlagErro(B, O, fioErro);
	CarryOut(S[4], fioCarry);
	muxFlag(FlagCarryOut, FlagOverflow, FlagErro, fioCarry, fioOverflow, fioErro, O);
	FlagZero(mux, FlagZero);
	
	mux8bit(S, Ss, Sm, Sd, Sa, So, Sxor, O, mux); 
	displayunidade(mux, d1[0], d1[1], d1[2], d1[3], d1[4], d1[5], d1[6]); 
	displaydezena(mux, d2[0], d2[1], d2[2], d2[3], d2[4], d2[5], d2[6]); 

endmodule

//flag zero
module FlagZero(S,S1);

	input [7:0]S;
	output S1;
	nor Nor0(S1,S[0],S[1],S[2],S[3], S[4], S[5], S[6], S[7]);

endmodule	

module FlagErro(B,O,S);

        input [3:0]B;
        input [2:0]O;
        output S;
        wire [4:0]w;
        nor Nor0(w[0],B[0],B[1]);
        nor Nor1(w[1],B[2],B[3]);
        and And0(w[2],w[0],w[1]);
        and And1(w[3],O[0],O[1]);
        and And2(w[4],w[3],O[2]);
        or Or0(S,w[2],w[4]);
    
endmodule


//flag cout
module CarryOut(Cout,S);
	input Cout;
	output S;
	and and0 (S,Cout,Cout);
endmodule	


//flag overflow
module overflow(Bout,S);
	input Bout;
	output S;
	and and0 (S,Bout,Bout);
endmodule

module flags(SZ, SC, SE, SO, resultado, Bout, Op, Cout, B); // B é uma entrada
	input [7:0]resultado;
	input Bout, Cout;	
	input [3:0]B;
	input [2:0]Op;
	output SZ, SE, SC, SO;
	
	overflow Overflow0(Bout, SO);
	FlagErro Erro(B, Op, SE);
	CarryOut FlagCarryOut(Cout, SC);
	FlagZero FlagZero0(resultado, SZ);
	
endmodule
module muxFlag(out0, out1, out2, in0, in1, in3, sel);
	input in0, in1, in3;
	input [2:0] sel;
	output out0, out1, out2;
	
	wire notsel0, notsel1, notsel2;
	
	
	not(notsel0, sel[0]);
	not(notsel1, sel[1]);
	not(notsel2, sel[2]);
	
	and(out0,notsel2, notsel1, notsel0, in0);//00 - Carry
	and(out1,notsel2, notsel1, sel[0], in1);//01 - Overflow
	and(out2,notsel2, sel[1], sel[0], in3); //11 - Erro
	
endmodule
	
	