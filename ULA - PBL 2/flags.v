//Overflow subtração
module overflow(Bout,S);
	input Bout;
	output S;
	and and0 (S,Bout,Bout);
endmodule

module FlagErro(B, O, S);

    input [7:0] B;
    input [2:0] O;
    output S;

	 wire not_o;	
    wire b_eh_zero;
    wire operacao_eh_011; 
	 
	 nor Nor_B(b_eh_zero, B[0], B[1], B[2], B[3],B[4],B[5],B[6],B[7]);
    not(not_o, O[2]);
	 

    and And_O(operacao_eh_011, O[0], O[1], not_o);
    
   
    or Or0(S, b_eh_zero, operacao_eh_111);
    
endmodule

//flag cout
module CarryOut(Cout,S);
	input Cout;
	output S;
	
	and and0 (S,Cout,Cout);
	
endmodule	

// Flag Zero
module FlagZero(S, S1);

	input [12:0] S;
	output S1;

	nor Nor0(S1, 
		S[0], S[1], S[2], S[3],
		S[4], S[5], S[6], S[7],
		S[8], S[9], S[10], S[11],
		S[12]);

endmodule


//flag overflow
module overflow12bits(Saida,S);
	input [15:0]Saida;
	output S;
	or or0 (S,Saida[12],Saida[13],Saida[14],Saida[15]);
endmodule

module overflow8bits(Saida,S);
	input [15:0]Saida;
	output S;
	or or0 (S,Saida[8],Saida[9],Saida[10],Saida[11],Saida[12],Saida[13],Saida[14],Saida[15]);
endmodule




module muxFlag(out0, out1, out2, in0, in1, in3, sel,enable);
	input in0, in1, in3, enable;
	input [2:0] sel;
	output out0, out1, out2;
	
	wire notsel0, notsel1, notsel2;
	
	
	not(notsel0, sel[0]);
	not(notsel1, sel[1]);
	not(notsel2, sel[2]);
	
	and(out0,notsel2, notsel1, notsel0, in0, enable);//00 - Carry
	and(out1,notsel2, notsel1, sel[0], in1, enable);//01 - Overflow
	and(out2,notsel2, sel[1], sel[0], in3, enable); //11 - Erro
	
endmodule






