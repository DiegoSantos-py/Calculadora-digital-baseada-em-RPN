

module sum4bit(Cout, S, A, B, C); 
	input [3:0]A; 
	input [3:0]B; 
	input C;
	output Cout; 
	output [3:0]S; 
	wire [2:0]Co; 
	sum somador1(Co[0], S[0], A[0], B[0], C); 
	sum somador2(Co[1], S[1], A[1], B[1], Co[0]); 
	sum somador3(Co[2], S[2], A[2], B[2], Co[1]); 
	sum somador4(Cout, S[3], A[3], B[3], Co[2]); 
endmodule

module sum8bit(Cout, S, A, B);
	input [7:0]A;
	input [7:0]B;
	output Cout;
	output [7:0]S;
	
	wire [6:0]Co;

	sum somador1(Co[0], S[0], A[0], B[0], 1'b0);
	sum somador2(Co[1], S[1], A[1], B[1], Co[0]);
	sum somador3(Co[2], S[2], A[2], B[2], Co[1]);
	sum somador4(Co[3], S[3], A[3], B[3], Co[2]);
	sum somador5(Co[4], S[4], A[4], B[4], Co[3]);
	sum somador6(Co[5], S[5], A[5], B[5], Co[4]);
	sum somador7(Co[6], S[6], A[6], B[6], Co[5]);
	sum somador8(Cout, S[7], A[7], B[7], Co[6]);

endmodule

module sum16bit(Cout, S, A, B);
	input [15:0]A;
	input [15:0]B;
	output Cout;
	output [15:0]S;
	wire [14:0]Co;

	sum somador01(Co[0], S[0], A[0], B[0], 1'b0);
	sum somador02(Co[1], S[1], A[1], B[1], Co[0]);
	sum somador03(Co[2], S[2], A[2], B[2], Co[1]);
	sum somador04(Co[3], S[3], A[3], B[3], Co[2]);
	sum somador05(Co[4], S[4], A[4], B[4], Co[3]);
	sum somador06(Co[5], S[5], A[5], B[5], Co[4]);
	sum somador07(Co[6], S[6], A[6], B[6], Co[5]);
	sum somador08(Co[7], S[7], A[7], B[7], Co[6]);
	sum somador09(Co[8], S[8], A[8], B[8], Co[7]);
	sum somador10(Co[9], S[9], A[9], B[9], Co[8]);
	sum somador11(Co[10], S[10], A[10], B[10], Co[9]);
	sum somador12(Co[11], S[11], A[11], B[11], Co[10]);
	sum somador13(Co[12], S[12], A[12], B[12], Co[11]);
	sum somador14(Co[13], S[13], A[13], B[13], Co[12]);
	sum somador15(Co[14], S[14], A[14], B[14], Co[13]);
	sum somador16(Cout, S[15], A[15], B[15], Co[14]);

endmodule


	
