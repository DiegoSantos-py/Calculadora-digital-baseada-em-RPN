module display_unidade_hexa(B3, B2, B1, B0, A, B, C, D, E, F, G);
    input B3, B2, B1, B0;
    output A, B, C, D, E, F, G;

    // inversões dos bits
    wire nb3, nb2, nb1, nb0;
    not (nb3, B3);
    not (nb2, B2);
    not (nb1, B1);
    not (nb0, B0);

    // --- Segmento A (ativa em 0) ---
    wire a_t1, a_t2, a_t3, a_t4;
    and (a_t1, B0, B1, B3, nb2);      // B0 & B1 & B3 & ~B2
    and (a_t2, B0, B2, B3, nb1);      // B0 & B2 & B3 & ~B1
    and (a_t3, B0, nb1, nb2, nb3);    // B0 & ~B1 & ~B2 & ~B3
    and (a_t4, B2, nb0, nb1, nb3);    // B2 & ~B0 & ~B1 & ~B3
    or  (A, a_t1, a_t2, a_t3, a_t4);

    // --- Segmento B ---
    wire b_t1, b_t2, b_t3, b_t4;
    and (b_t1, B0, B1, B3);            // B0 & B1 & B3
    and (b_t2, B1, B2, nb0);          // B1 & B2 & ~B0
    and (b_t3, B2, B3, nb0);          // B2 & B3 & ~B0
    and (b_t4, B0, B2, nb1, nb3);     // B0 & B2 & ~B1 & ~B3
    or  (B, b_t1, b_t2, b_t3, b_t4);

    // --- Segmento C ---
    wire c_t1, c_t2, c_t3;
    and (c_t1, B1, B2, B3);           // B1 & B2 & B3
    and (c_t2, B2, B3, nb0);          // B2 & B3 & ~B0
    and (c_t3, B1, nb0, nb2, nb3);    // B1 & ~B0 & ~B2 & ~B3
    or  (C, c_t1, c_t2, c_t3);

    // --- Segmento D ---
    wire d_t1, d_t2, d_t3, d_t4;
    and (d_t1, B0, B1, B2);           // B0 & B1 & B2
    and (d_t2, B1, B3, nb0, nb2);     // B1 & B3 & ~B0 & ~B2
    and (d_t3, B0, nb1, nb2, nb3);    // B0 & ~B1 & ~B2 & ~B3
    and (d_t4, B2, nb0, nb1, nb3);    // B2 & ~B0 & ~B1 & ~B3
    or  (D, d_t1, d_t2, d_t3, d_t4);

    // --- Segmento E ---
    wire e_t1, e_t2, e_t3;
    and (e_t1, B0, nb3);              // B0 & ~B3
    and (e_t2, B0, nb1, nb2);         // B0 & ~B1 & ~B2
    and (e_t3, B2, nb1, nb3);         // B2 & ~B1 & ~B3
    or  (E, e_t1, e_t2, e_t3);

    // --- Segmento F ---
    wire f_t1, f_t2, f_t3, f_t4;
    and (f_t1, B0, B1, nb3);          // B0 & B1 & ~B3
    and (f_t2, B0, nb2, nb3);         // B0 & ~B2 & ~B3
    and (f_t3, B1, nb2, nb3);         // B1 & ~B2 & ~B3
    and (f_t4, B0, B2, B3, nb1);      // B0 & B2 & B3 & ~B1
    or  (F, f_t1, f_t2, f_t3, f_t4);

    // --- Segmento G ---
    wire g_t1, g_t2, g_t3;
    and (g_t1, B0, B1, B2, nb3);      // B0 & B1 & B2 & ~B3
    and (g_t2, nb1, nb2, nb3);        // ~B1 & ~B2 & ~B3
    and (g_t3, B2, B3, nb0, nb1);     // B2 & B3 & ~B0 & ~B1
    or  (G, g_t1, g_t2, g_t3);

endmodule

module display_dezena_hexa(B4, B5, A, B, C, D, E, F, G);
   input B4, B5;
   output A, B, C, D, E, F, G;
   wire nb4, nb5;

   not (nb4, B4);
   not (nb5, B5);

   and (A, B4, nb5);
   or (B, 1'b0, 1'b0);
   and (C, B5, nb4);
   and (D, nb5, B4);
	or (E, 1'b0, B4);
   or (F, B4, B5);
	or (G, 1'b0, nb5);

endmodule