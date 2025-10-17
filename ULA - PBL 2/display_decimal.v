module display_decimal(A, out);
	input [12:0]A;
	output [27:0] out;
	
	wire [3:0] db1, db2, db3, db4, db5, db6, db7, db8, db9, db10, db11, db12;
	
	double_dabble db001({3'b000, A[12]}, db1);
	double_dabble db002({db1[2], db1[1], db1[0],A[11]}, db2);
	double_dabble db003({db2[2], db2[1], db2[0],A[10]}, db3);
	double_dabble db004({db3[2], db3[1], db3[0],A[9]}, db4);
	double_dabble db005({db4[2], db4[1], db4[0],A[8]}, db5);
	double_dabble db006({db5[2], db5[1], db5[0],A[7]}, db6);
	double_dabble db007({db6[2], db6[1], db6[0],A[6]}, db7);
	double_dabble db008({db7[2], db7[1], db7[0],A[5]}, db8);
	double_dabble db009({db8[2], db8[1], db8[0],A[4]}, db9);
	double_dabble db0010({db9[2], db9[1], db9[0],A[3]}, db10);
	double_dabble db0011({db10[2], db10[1], db10[0],A[2]}, db11);
	double_dabble db0012({db11[2], db11[1], db11[0],A[1]}, db12);

	wire [3:0] db2_1, db2_2, db2_3, db2_4, db2_5, db2_6, db2_7, db2_8, db2_9, db2_10, db2_11;
	
	double_dabble db002_1({3'b000, db1[3]}, db2_1);
	double_dabble db002_2({db2_1[2], db2_1[1],db2_1[0], db2[3]}, db2_2);
	double_dabble db002_3({db2_2[2], db2_2[1],db2_2[0], db3[3]}, db2_3);
	double_dabble db002_4({db2_3[2], db2_3[1],db2_3[0], db4[3]}, db2_4);
	double_dabble db002_5({db2_4[2], db2_4[1],db2_4[0], db5[3]}, db2_5);
	double_dabble db002_6({db2_5[2], db2_5[1],db2_5[0], db6[3]}, db2_6);
	double_dabble db002_7({db2_6[2], db2_6[1],db2_6[0], db7[3]}, db2_7);
	double_dabble db002_8({db2_7[2], db2_7[1],db2_7[0], db8[3]}, db2_8);
	double_dabble db002_9({db2_8[2], db2_8[1],db2_8[0], db9[3]}, db2_9);
	double_dabble db002_10({db2_9[2], db2_9[1],db2_9[0], db10[3]}, db2_10);
	double_dabble db002_11({db2_10[2], db2_10[1],db2_10[0], db11[3]}, db2_11);
	
	wire [3:0] db3_1, db3_2, db3_3, db3_4, db3_5, db3_6, db3_7, db3_8, db3_9;
	
	double_dabble db003_1({2'b00, db2_1[3], db2_2[3]}, db3_1);
	double_dabble db003_2({db3_1[2], db3_1[1], db3_1[0], db2_3[3]}, db3_2);
	double_dabble db003_3({db3_2[2], db3_2[1], db3_2[0], db2_4[3]}, db3_3);
	double_dabble db003_4({db3_3[2], db3_3[1], db3_3[0], db2_5[3]}, db3_4);
	double_dabble db003_5({db3_4[2], db3_4[1], db3_4[0], db2_6[3]}, db3_5);
	double_dabble db003_6({db3_5[2], db3_5[1], db3_5[0], db2_7[3]}, db3_6);
	double_dabble db003_7({db3_6[2], db3_6[1], db3_6[0], db2_8[3]}, db3_7);
	double_dabble db003_8({db3_7[2], db3_7[1], db3_7[0], db2_9[3]}, db3_8);
	double_dabble db003_9({db3_8[2], db3_8[1], db3_8[0], db2_10[3]}, db3_9);
	
	wire [3:0] db4_1, db4_2, db4_3, db4_4, db4_5, db4_6, db4_7, db4_8, db4_9;
	
	double_dabble db004_1({1'b0, db3_1[3], db3_2[3], db3_3[3]}, db4_1);
	double_dabble db004_2({db4_1[2], db4_1[1], db4_1[0], db3_4[3]}, db4_2);
	double_dabble db004_3({db4_2[2], db4_2[1], db4_2[0], db3_5[3]}, db4_3);
	double_dabble db004_4({db4_3[2], db4_3[1], db4_3[0], db3_6[3]}, db4_4);
	double_dabble db004_5({db4_4[2], db4_4[1], db4_4[0], db3_7[3]}, db4_5);
	double_dabble db004_6({db4_5[2], db4_5[1], db4_5[0], db3_8[3]}, db4_6);
	
	decoder_decimal(db12[2], db12[1], db12[0], A[0], out[0], out[1], out[2], out[3], out[4], out[5], out[6]);
	decoder_decimal(db2_11[2], db2_11[1], db2_11[0], db12[3], out[7], out[8], out[9], out[10], out[11], out[12], out[13]);
	decoder_decimal(db3_9[2], db3_9[1], db3_9[0], db2_11[3], out[14], out[15], out[16], out[17], out[18], out[19], out[20]);
	decoder_decimal(db4_6[2], db4_6[1], db4_6[0], db3_9[3], out[21], out[22], out[23], out[24], out[25], out[26], out[27]);
	
endmodule


