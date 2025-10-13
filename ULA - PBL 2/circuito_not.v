module NOT_operation(S, A);
	input [7:0]A;
	output [7:0]S;
	
	not not1(S[0], A[0]);
	not not2(S[1], A[1]);
	not not3(S[2], A[2]);
	not not4(S[3], A[3]);
	not not5(S[4], A[4]);
	not not6(S[5], A[5]);
	not not7(S[6], A[6]);
	not not8(S[7], A[7]);

endmodule
