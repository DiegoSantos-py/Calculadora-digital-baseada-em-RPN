module NOT_operation(S, A);
	input [7:0]A;
	output [7:0]S;
	
	not xor1(S[0], A[0]);
	not xor2(S[1], A[1]);
	not xor3(S[2], A[2]);
	not xor4(S[3], A[3]);
	not xor5(S[4], A[4]);
	not xor6(S[5], A[5]);
	not xor7(S[6], A[6]);
	not xor8(S[7], A[7]);

endmodule
