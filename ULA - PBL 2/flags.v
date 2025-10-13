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