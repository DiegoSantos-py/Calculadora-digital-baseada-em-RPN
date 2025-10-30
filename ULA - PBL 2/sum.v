module sum(Cout, S, A, B, C);
	input A, B, C;
	output Cout, S;
	wire f1, f2, f3;
	
	xor (f1, A, B);
	xor (S, C, f1);
	and (f2, A, B);
	and (f3, f1, C);
	or (Cout, f3, f2);
	
endmodule

