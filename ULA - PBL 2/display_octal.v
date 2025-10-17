// d_octal.v
// Módulo Verilog estrutural (sem uso de assign) que implementa as saídas a..g a partir de A,B,C
// Expressões simplificadas conforme o enunciado

module d_octal(
    input  A,
    input  B,
    input  C,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
);

	// Declaração de fios internos
	wire nA, nB, nC;
	wire AxorC, AxorB;
	wire term_d1, term_d2, term_e1, term_e2, term_f1, term_f2, term_g1, term_g2;

	// Inversores
	not (nA, A);
	not (nB, B);
	not (nC, C);

	// XORs
	xor (AxorC, A, C);
	xor (AxorB, A, B);

	and (a, nB, AxorC);

	and (b, C, AxorB);

	and (c, nC, B, nA);

	and (term_d1, nB, AxorC);
	and (term_d2, A, B, C);
	or  (d, term_d1, term_d2);

	and (term_e1, C, nB);
	or  (e, A, term_e1);


	wire term_fa, term_fb, term_fc;

	or  (term_fa, A, B);       
	and (term_fb, nC, term_fa);
	and (term_fc, A, B);        
	or  (f, term_fb, term_fc);  

	and (term_g1, nC, nB);
	and (term_g2, A, B, C);
	or  (g, term_g1, term_g2);

endmodule

module display_octal(
    input A0, A1, A2, 
    input B0, B1, B2,
	 input C0, C1, C2, 
    input D0, D1, D2,
	 input E0, E1, E2, 
    input F0, F1, F2,
    output [6:0] d1, d2, d3, d4
);

    d_octal unidade(
        A0, A1, A2,
        d1[0], d1[1], d1[2], d1[3], d1[4], d1[5], d1[6]
    );

    d_octal dezena(
        B0, B1, B2,
        d2[0], d2[1], d2[2], d2[3], d2[4], d2[5], d2[6]
    );
	 
	 d_octal centena(
        C0, C1, C2,
        d3[0], d3[1], d3[2], d3[3], d3[4], d3[5], d3[6]
    );

    d_octal milhar(
        D0, D1, D2,
        d4[0], d4[1], d4[2], d4[3], d4[4], d4[5], d4[6]
    );
	
endmodule