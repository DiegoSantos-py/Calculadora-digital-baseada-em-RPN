module mux2x1(out, in0, in1, sel);
    input in0, in1, sel;
    output out;
    
    wire w1, w2, w3;
    
    not (w3, sel);
    and (w1, in0, w3);
    and (w2, in1, sel);
    or  (out, w1, w2);
endmodule


module mux8bit(
	input in0,
	input in1,
	input in2,
	input in3,
	input in4,
	input in5,
	input in6,
	input in7,
	input [2:0]sel,
	output out
	);
	
	wire w0, w1, w2, w3, w4, w5, w6, w7;
	wire [2:0]nsel;
	
	not notsel0(nsel[0], sel[0]);
	not notsel1(nsel[1], sel[1]);
	not notsel2(nsel[2], sel[2]);
	
	and and00(w0, nsel[0], nsel[1], nsel[2], in0);
	
	and and01(w1, sel[0], nsel[1], nsel[2], in1);
	
	and and02(w2, nsel[0], sel[1], nsel[2], in2);
	
	and and03(w3, sel[0], sel[1], nsel[2], in3);
	
	and and04(w4, nsel[0], nsel[1], sel[2], in4);
	
	and and05(w5, sel[0], nsel[1], sel[2], in5);
	
	and and06(w6, nsel[0], sel[1], sel[2], in6);
	
	and and07(w7, sel[0], sel[1], sel[2], in7);
	
	or or00(out, w0, w1, w2, w3, w4, w5, w6, w7);
	
endmodule


module mux(
	input [7:0]in0,
	input [7:0]in1,
	input [7:0]in2,
	input [7:0]in3,
	input [7:0]in4,
	input [7:0]in5,
	input [7:0]in6,
	input [7:0]in7,
	input [2:0]sel,
	output [7:0]out
	);
	
	
	mux8bit mux00(in0[0], in1[0],in2[0],in3[0],in4[0],in5[0],in6[0],in7[0],sel, out[0]);
	mux8bit mux01(in0[1], in1[1],in2[1],in3[1],in4[1],in5[1],in6[1],in7[1],sel, out[1]);
	mux8bit mux02(in0[2], in1[2],in2[2],in3[2],in4[2],in5[2],in6[2],in7[2],sel, out[2]);
	mux8bit mux03(in0[3], in1[3],in2[3],in3[3],in4[3],in5[3],in6[3],in7[3],sel, out[3]);
	mux8bit mux04(in0[4], in1[4],in2[4],in3[4],in4[4],in5[4],in6[4],in7[4],sel, out[4]);
	mux8bit mux05(in0[5], in1[5],in2[5],in3[5],in4[5],in5[5],in6[5],in7[5],sel, out[5]);
	mux8bit mux06(in0[6], in1[6],in2[6],in3[6],in4[6],in5[6],in6[6],in7[6],sel, out[6]);
	mux8bit mux07(in0[7], in1[7],in2[7],in3[7],in4[7],in5[7],in6[7],in7[7],sel, out[7]);
	
endmodule

	
	