module sub(S, A, B, bin, bout);
	input A, B, bin;
	output S, bout;
	wire nota, f1, f2, f3;
	
	not (nota, A);
	and and0(f1, B, bin);
	and and1(f2, nota, f3);
	xor xor0(f3, B, bin);
	xor xor1(S, A, f3);
	or or0(bout, f1,f2);
	
endmodule