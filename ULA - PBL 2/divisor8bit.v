module mux_divisor(out, A, B, sel);
	input sel;
	input [7:0]A;
	input [7:0]B;
	output [7:0]out;
	
	mux2x1 mux01(out[0], A[0], B[0], sel);
	mux2x1 mux02(out[1], A[1], B[1], sel);
	mux2x1 mux03(out[2], A[2], B[2], sel);
	mux2x1 mux04(out[3], A[3], B[3], sel);
	mux2x1 mux05(out[4], A[4], B[4], sel);
	mux2x1 mux06(out[5], A[5], B[5], sel);
	mux2x1 mux07(out[6], A[6], B[6], sel);
	mux2x1 mux08(out[7], A[7], B[7], sel);
endmodule

module divisor8bit(Q, A, B);
	input [7:0]A;
	input [7:0]B;
	output [7:0]Q;
	
	wire div_zero, not_div_zero;
   wire or1, or2;
	
	// div_zero = 1 se B == 0000
    or (or1, B[0], B[1]);
    or (or2, B[2], B[3]);
	 or (or3, B[4], B[5]);
	 or (or4, B[6], B[7]);
    or (notdivzero, or1, or2, or3, or4);
    not (divzero, notdivzero);
	 
    wire bout0, bout1, bout2, bout3, bout4, bout5, bout6, bout7;
    wire [7:0] subout0, subout1, subout2, subout3, subout4, subout5, subout6, subout7;
    wire [7:0] prev0, prev1, prev2, prev3, prev4, prev5, prev6;
	 wire [7:0]Qtemp;

    sub8bit sub0(.A({6'b000, A[7]}), .B(B), .bin(1'b0), .S(subout0), .bout(bout0));
    mux_divisor mux0 (.sel(bout0), .A(subout0), .B({3'b000, A[7]}), .out(prev0));
    not(Qtemp[7], bout0);

	 sub8bit sub1(.A({prev0[6:0], A[6]}), .B(B), .bin(1'b0), .S(subout1), .bout(bout1));
    mux_divisor mux1 (.sel(bout1), .A(subout1), .B({prev0[6:0], A[6]}), .out(prev1));
    not(Qtemp[6], bout1);

	 sub8bit sub2(.A({prev1[6:0], A[5]}), .B(B), .bin(1'b0), .S(subout2), .bout(bout2));
    mux_divisor mux2 (.sel(bout2), .A(subout2), .B({prev1[6:0], A[5]}), .out(prev2));
    not(Qtemp[5], bout2);
	 
	 sub8bit sub3(.A({prev2[6:0], A[4]}), .B(B), .bin(1'b0), .S(subout3), .bout(bout3));
    mux_divisor mux3 (.sel(bout3), .A(subout3), .B({prev2[6:0], A[4]}), .out(prev3));
    not(Qtemp[4], bout3);
	 
	 sub8bit sub4(.A({prev3[6:0], A[3]}), .B(B), .bin(1'b0), .S(subout4), .bout(bout4));
    mux_divisor mux4 (.sel(bout4), .A(subout4), .B({prev3[6:0], A[3]}), .out(prev4));
    not(Qtemp[3], bout4);
	 
	 sub8bit sub5(.A({prev4[6:0], A[2]}), .B(B), .bin(1'b0), .S(subout5), .bout(bout5));
    mux_divisor mux5 (.sel(bout5), .A(subout5), .B({prev4[6:0], A[2]}), .out(prev5));
    not(Qtemp[2], bout5);
	 
	 sub8bit sub6(.A({prev5[6:0], A[1]}), .B(B), .bin(1'b0), .S(subout6), .bout(bout6));
    mux_divisor mux6 (.sel(bout6), .A(subout6), .B({prev5[6:0], A[1]}), .out(prev6));
    not(Qtemp[1], bout6);
	 
	 sub8bit sub7(.A({prev6[6:0], A[0]}), .B(B), .bin(1'b0), .S(subout7), .bout(bout7));
    mux_divisor mux7 (.sel(bout7), .A(subout7), .B({prev6[6:0], A[0]}), .out(prev7));
    not(Qtemp[0], bout7);
	 
	 and (Q[0], Qtemp[0], notdivzero);
    and (Q[1], Qtemp[1], notdivzero);
    and (Q[2], Qtemp[2], notdivzero);
    and (Q[3], Qtemp[3], notdivzero);
    and (Q[4], Qtemp[4], notdivzero);
	 and (Q[5], Qtemp[5], notdivzero);
    and (Q[6], Qtemp[6], notdivzero);
    and (Q[7], Qtemp[7], notdivzero);
    
	 
endmodule