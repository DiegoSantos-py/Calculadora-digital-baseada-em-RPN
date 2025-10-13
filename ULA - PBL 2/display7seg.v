module hex0(
    input a6, a5, a4, a3, a2, a1, a0,
    output F
);

    
    wire na6, na5, na4, na3, na2, na1, na0;
    not (na6, a6);
    not (na5, a5);
    not (na4, a4);
    not (na3, a3);
    not (na2, a2);
    not (na1, a1);
    not (na0, a0);

   
    wire t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    wire t11, t12, t13, t14, t15, t16, t17, t18, t19, t20;
    wire t21, t22, t23, t24, t25, t26, t27;

    or (t1,  a6, a5, a4, a2, a0);
    or (t2,  a6, a5, a3, na1);
    or (t3,  a5, a3, a2, na1);
    or (t4,  a5, a3, na1, a0);
    or (t5,  a6, a4, na2, na0);
    or (t6,  a5, a4, na3, a1);
    or (t7,  a5, na3, na2, a1);
    or (t8,  na4, a3, a2, a0);
    or (t9,  a6, a5, na4, a2, na0);
    or (t10, na4, a2, na1, a0);
    or (t11, a6, a5, na4, na2, a0);
    or (t12, na5, a3, a1);
    or (t13, na5, a2, a1, a0);
    or (t14, na5, a4, a3, na0);
    or (t15, na5, a4, a3, na2);
    or (t16, na5, a3, na2, na0);
    or (t17, na5, na3, na1);
    or (t18, na5, na4, a2, a1);
    or (t19, na5, na4, a1, a0);
    or (t20, na6, a4, a2, na0);
    or (t21, na6, a4, na2, a1);
    or (t22, na6, a4, na2, a0);
    or (t23, na6, na3, a1);
    or (t24, na6, a4, na3, na2);
    or (t25, na6, na4, na2, na0);
    or (t26, na6, na5);

  
    and (F,
        t1, t2, t3, t4, t5, t6, t7, t8, t9, t10,
        t11, t12, t13, t14, t15, t16, t17, t18, t19, t20,
        t21, t22, t23, t24, t25, t26
    );

endmodule

module hex1(
    input a6, a5, a4, a3, a2, a1, a0,
    output F
);

  
    wire na6, na5, na4, na3, na2, na1, na0;
    not (na6, a6);
    not (na5, a5);
    not (na4, a4);
    not (na3, a3);
    not (na2, a2);
    not (na1, a1);
    not (na0, a0);

    wire t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    wire t11, t12, t13, t14, t15, t16, t17, t18, t19, t20;
    wire t21, t22, t23, t24, t25, t26, t27, t28;

    or (t1,  a6, a5, a4, a2);
    or (t2,  a6, a5, a4, a1, a0);
    or (t3,  a5, a4, a2, a1, a0);
    or (t4,  a5, a3, na1, na0);
    or (t5,  a6, a5, a4, na3, a1);
    or (t6,  a6, a5, a4, na3, a0);
    or (t7,  a6, a5, na3, a1, a0);
    or (t8,  a6, a4, na3, a1, a0);
    or (t9,  na4, a3, a2, na0);
    or (t10, na4, a3, a2, na1);
    or (t11, na4, a2, na1, na0);
    or (t12, a6, a5, na4, na2);
    or (t13, na4, na2, a1, a0);
    or (t14, a6, na4, na3, na2);
    or (t15, a6, na5, a3, a2, a1);
    or (t16, na5, a3, a1, na0);
    or (t17, na5, a2, a1, na0);
    or (t18, na5, a3, na1, a0);
    or (t19, na5, a2, na1, a0);
    or (t20, na5, a4, na2, na1, na0);
    or (t21, na5, a4, na3, a2);
    or (t22, na6, a4, a3, na2);
    or (t23, na6, a4, na2, na1);
    or (t24, na6, na3, a1, na0);
    or (t25, na6, na3, na1, a0);
    or (t26, na6, na4, a2);
    or (t27, na6, na5, na1);
    or (t28, na6, na5, na2);

  
    and (F,
        t1, t2, t3, t4, t5, t6, t7, t8, t9, t10,
        t11, t12, t13, t14, t15, t16, t17, t18, t19, t20,
        t21, t22, t23, t24, t25, t26, t27, t28
    );

endmodule

module hex2(
    input a6, a5, a4, a3, a2, a1, a0,
    output F
);

    
    wire na6, na5, na4, na3, na2, na1, na0;
    not (na6, a6);
    not (na5, a5);
    not (na4, a4);
    not (na3, a3);
    not (na2, a2);
    not (na1, a1);
    not (na0, a0);

   
    wire t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    wire t11, t12, t13, t14, t15;

    or (t1,  a6, a5, a2, a1);
    or (t2,  a5, a3, a1);
  
    or (t3,  a4, a3, na2);
    or (t4,  a5, na3, na1);
    or (t5,  a6, a5, na4, a1);
    or (t6,  a6, na4, a2);
    or (t7,  na4, a2, a1);
    or (t8,  na5, a3, na1);
    or (t9,  na5, a4, na2);
    or (t10, na5, na3, a1);
    or (t11, na6, a4, a3);
    or (t12, na6, a4, na2);
    or (t13, na6, a3, na2);
    or (t14, na6, na5);

   
    and (F,
        t1, t2, na0, t3, t4, t5, t6, t7, t8,
        t9, t10, t11, t12, t13, t14
    );

endmodule

module hex3(
    input a6, a5, a4, a3, a2, a1, a0,
    output F
);

   
    wire na6, na5, na4, na3, na2, na1, na0;
    not (na6, a6);
    not (na5, a5);
    not (na4, a4);
    not (na3, a3);
    not (na2, a2);
    not (na1, a1);
    not (na0, a0);

   
    wire t1, t2, t3, t4, t5, t6, t7, t8;
    wire t9, t10, t11, t12, t13, t14, t15, t16;
    wire t17, t18, t19, t20, t21, t22, t23, t24;
    wire t25, t26, t27, t28, t29, t30, t31, t32;

    or (t1,  a6, a5, a4, a2, a0);
    or (t2,  a6, a5, a3, a2, na1);
    or (t3,  a5, a3, na1, a0);
    or (t4,  a6, a5, a4, na2, a1, na0);
    or (t5,  a6, a5, a4, na3, a1);
    or (t6,  a6, a5, na3, a1, na0);
    or (t7,  a6, a5, a4, na3, na2, na0);
    or (t8,  a6, a4, na3, na2, a1, na0);
    or (t9,  a6, a5, na4, a3, a0);
    or (t10, na4, a3, a2, a0);
    or (t11, a6, a5, na4, a3, na1);
    or (t12, a5, na4, a3, a2, na1);
    or (t13, na4, a2, na1, a0);
    or (t14, a6, na4, na3, na2, a0);
    or (t15, a5, na4, na3, na2, a1);
    or (t16, na5, a3, a1, a0);
    or (t17, a6, na5, a4, a3, a2, na0);
    or (t18, na5, a4, a3, na2, na1);
    or (t19, na5, na3, a2, a0);
    or (t20, na5, na3, a2, na1);
    or (t21, na5, na3, na1, a0);
    or (t22, na5, na4, a3, a1);
    or (t23, na5, na4, na2, na1, na0);
    or (t24, na6, a5, a4, a3, a1, na0);
    or (t25, na6, a4, na2, a0);
    or (t26, na6, a3, na2, a1, na0);
    or (t27, na6, na3, a2, a1);
    or (t28, na6, a4, na3, na1, na0);
    or (t29, na6, na3, na2, na1, na0);
    or (t30, na6, na5, a0);
    or (t31, na6, na5, na1);
    or (t32, na6, na5, na3);

    
    and (F,
        t1, t2, t3, t4, t5, t6, t7, t8,
        t9, t10, t11, t12, t13, t14, t15, t16,
        t17, t18, t19, t20, t21, t22, t23, t24,
        t25, t26, t27, t28, t29, t30, t31, t32
    );

endmodule


module hex4(
    input a6, a5, a4, a3, a2, a1, a0,
    output F
);

 
    wire na6, na5, na4, na3, na2, na1, na0;
    not (na6, a6);
    not (na5, a5);
    not (na4, a4);
    not (na3, a3);
    not (na2, a2);
    not (na1, a1);
    not (na0, a0);


    wire t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13;

    or (t1,  a6, a4, a2, a1, a0);
    or (t2,  a5, a3, na1, a0);
    or (t3,  a5, a4, na3, a1, a0);
    or (t4,  a6, na3, a2, na1, a0);
    or (t5,  a6, na4, a3, a1, a0);
    or (t6,  a6, na4, na3, na2, a0);
    or (t7,  a6, na5, a4, a3, na2, a0);
    or (t8,  a6, na5, na3, na1, a0);
    or (t9,  a6, na5, na4, a2, a0);
    or (t10, na6, a5, a4, na2, a0);
    or (t11, na6, a5, na3, a1, a0);
    or (t12, na6, a5, na4, a2, a0);
    or (t13, na6, na5, a4, a3, a2, a0);

    and (F,
        t1, t2, t3, t4, t5, t6, t7,
        t8, t9, t10, t11, t12, t13
    );

endmodule


module hex5(
    input a6, a5, a4, a3, a2, a1, a0,
    output F
);

    wire na6, na5, na4, na3, na2, na1, na0;
    not (na6, a6);
    not (na5, a5);
    not (na4, a4);
    not (na3, a3);
    not (na2, a2);
    not (na1, a1);
    not (na0, a0);

    wire t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    wire t11, t12, t13, t14, t15, t16, t17, t18, t19, t20;
    wire t21, t22, t23, t24, t25, t26;

    or (t1,  a5, a3, a1, a0);
    or (t2,  a5, a4, a3, na2, a1);
    or (t3,  a4, a3, na2, a0);
    or (t4,  a6, a5, na3, a2, a1);
    or (t5,  a5, na3, na1, a0);
    or (t6,  a5, a4, na3, na2, na1);
    or (t7,  a6, a5, na4, a3, a2, na1);
    or (t8,  a6, a5, na4, na3, a1);
    or (t9,  a5, na4, na3, a2, a1);
    or (t10, na5, a4, a3, na1);
    or (t11, na5, a4, na2, a0);
    or (t12, na5, a3, na2, na1);
    or (t13, na5, na3, a1, a0);
    or (t14, na5, a4, na3, na2, a1);
    or (t15, na5, na4, a3, a2, a1);
    or (t16, na5, na4, a2, a0);
    or (t17, na5, na4, na3, a2, na1);
    or (t18, na6, a5, a4, a3, a1);
    or (t19, na6, a4, a3, a0);
    or (t20, na6, a4, na2, a0);
    or (t21, na6, a3, na2, a1);
    or (t22, na6, a3, na2, a0);
    or (t23, na6, a4, na3, na1);
    or (t24, na6, na3, na2, na1);
    or (t25, na6, na5, na1);
    or (t26, na6, na5, na3);

    
    and (F,
        t1, t2, t3, t4, t5, t6, t7, t8, t9, t10,
        t11, t12, t13, t14, t15, t16, t17, t18, t19, t20,
        t21, t22, t23, t24, t25, t26
    );

endmodule

module hex6(
    input a6, a5, a4, a3, a2, a1, a0,
    output F
);

    
    wire na6, na5, na4, na3, na2, na1, na0;
    not (na6, a6);
    not (na5, a5);
    not (na4, a4);
    not (na3, a3);
    not (na2, a2);
    not (na1, a1);
    not (na0, a0);

    wire t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    wire t11, t12, t13, t14, t15, t16, t17, t18, t19, t20;
    wire t21, t22, t23, t24, t25;

    or (t1,  a6, a5, a3, a2, na1);
    or (t2,  a6, a5, a4, na2, a1);
    or (t3,  a6, a4, na2, a0);
    or (t4,  a6, a5, na3, a1);
    or (t5,  a5, na3, a2, a1);
    or (t6,  a5, na3, a1, a0);
    or (t7,  a6, a5, a4, na3, na2);
    or (t8,  a6, a4, na3, na2, a1);
    or (t9,  a6, a5, na4, a2, a0);
    or (t10, a6, na4, a2, a1, a0);
    or (t11, a6, a5, na4, a3, na1);
    or (t12, a5, na4, a3, na1, a0);
    or (t13, a6, na5, a4, a3, a2);
    or (t14, na5, a4, a3, na1);
    or (t15, na5, na3, a2, na1);
    or (t16, na5, na4, a3, a1);
    or (t17, na5, na4, na2, na1);
    or (t18, na6, a5, a4, a3, a1);
    or (t19, na6, a4, a2, a0);
    or (t20, na6, a3, na2, a1);
    or (t21, na6, a4, na3, na1);
    or (t22, na6, na4, a3, a2, na1);
    or (t23, na6, na4, na3, na2);
    or (t24, na6, na5, a0);
    or (t25, na6, na5, na3);

    and (F,
        t1, t2, t3, t4, t5, t6, t7, t8, t9, t10,
        t11, t12, t13, t14, t15, t16, t17, t18, t19, t20,
        t21, t22, t23, t24, t25
    );

endmodule


module displayunidade(a, Fhex0, Fhex1, Fhex2, Fhex3, Fhex4, Fhex5, Fhex6);
    input [6:0]a;
    output Fhex0, Fhex1, Fhex2, Fhex3, Fhex4, Fhex5, Fhex6;
     
     hex0 hex00(a[6], a[5], a[4], a[3], a[2], a[1], a[0], Fhex0);
     hex1 hex01(a[6], a[5], a[4], a[3], a[2], a[1], a[0], Fhex1);
     hex2 hex02(a[6], a[5], a[4], a[3], a[2], a[1], a[0], Fhex2);
     hex3 hex03(a[6], a[5], a[4], a[3], a[2], a[1], a[0], Fhex3);
     hex4 hex04(a[6], a[5], a[4], a[3], a[2], a[1], a[0], Fhex4);
     hex5 hex05(a[6], a[5], a[4], a[3], a[2], a[1], a[0], Fhex5);
     hex6 hex06(a[6], a[5], a[4], a[3], a[2], a[1], a[0], Fhex6);

endmodule
 
module displaydezena(A, hex7, hex8, hex9, hex10, hex11, hex12, hex13);
    input [6:0] A;
    output hex7, hex8, hex9, hex10, hex11, hex12, hex13;
    wire na0, na1, na2, na3, na4, na5, na6;
    wire [41:0] f;
    
    not a0(na0, A[0]);
    not a1(na1, A[1]);
    not a2(na2, A[2]);
    not a3(na3, A[3]);
    not a4(na4, A[4]);
    not a5(na5, A[5]);
    not a6(na6, A[6]);
    
    // Saída do hex7
    
    or or01(f[0], A[5], A[4], A[2], A[1]);
    or or02(f[1], A[4], A[3]);
    or or03(f[2], A[3], na2);
    or or04(f[3], na4, na3);
    or or05(f[4], na5, A[3], na1);
    and and_1(hex7, f[0], f[1], f[2], f[3], f[4], na6);

    // Saída do hex8
    
    or or11(f[5], A[6], A[4]);
    or or12(f[6], A[6], A[3], A[2], A[1]);
    or or13(f[7], A[4], na2, na1);
    or or14(f[8], A[4], na3);
    or or15(f[9], A[5], na4);
    or or16(f[10], na6, na5);
    and and_2(hex8, f[5], f[6], f[7], f[8], f[9], f[10]);
    
    //Saída do hex9
    
    or or21(f[11], A[3], A[2]);
    or or22(f[12], na3, na2, na1);
    and and_3(hex9, A[4], f[11], f[12], na5, na6);
    
    // Saída do hex10
    
    or or31(f[13], A[6], A[5], A[4], A[2], A[1]);
    or or32(f[14], A[4], A[3], A[6]);
    or or33(f[15], A[4], A[3], A[1]);
    or or34(f[16], na2, na4);
    or or35(f[17], na4, na3);
    or or36(f[18], na5, A[3], na1);
    or or37(f[19], na6, A[3], A[2]);
    or or38(f[20], na6, na5);
    and and_4(hex10, f[13], f[14], f[15], f[16], f[17], f[18], f[19], f[20]);
    
    // Saída do hex11
    
    or or41(f[21], A[6], A[5], A[4], A[2], A[1]);
    or or42(f[22], A[5], A[4], A[3], A[2]);
    or or43(f[23], A[6], A[5], A[3], na2);
    or or44(f[24], A[5], A[3], na2, A[1]);
    or or45(f[25], A[6], A[5], na4, na3, A[2]);
    or or46(f[26], A[6], A[5], na4, na3, A[1]);
    or or47(f[27], A[6], na5, na4, na3, na2);
    or or48(f[28], na6, A[5], na4, A[3]);
    or or49(f[29], na6, A[5], na4, A[2], A[1]);
    and and_5(hex11, f[21], f[22], f[23], f[24], f[25], f[26], f[27], f[28], f[29]);
    
    // Saída do hex12
    
    or or51(f[30], A[6], A[5], A[4], A[3]);
    or or52(f[31], A[6], A[5], A[4], A[2], A[1]);
    or or53(f[32], na5, na3);
    or or54(f[33], na5, na4);
    or or55(f[34], na6, A[3], A[2]);
    or or56(f[35], na6, A[3], A[1]);
    or or57(f[36], na6, na4);
    or or58(f[37], na6, na5);
    and and_6(hex12, f[30], f[31], f[32], f[33], f[34], f[35], f[36], f[37]);
    
    // Saída do hex13
    
    and and1(f[38], na6, na5, na4);
    and and2(f[39], na6, na5, na3, na2);
    and and3(f[40], na5, na4, A[2], A[1]);
    and and4(f[41], na5, na4, A[3]);
    or or1(hex13, f[38], f[39], f[40], f[41]);
    
endmodule



