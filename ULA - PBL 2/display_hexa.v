module display_hex(b0, b1, b2, b3, a, b, c, d, e, f, g);
    input b0, b1, b2, b3;
    output a, b, c, d, e, f, g;
    wire [24:0] w;

    // Inversões
    wire nb0, nb1, nb2, nb3;
    not (nb0, b0);
    not (nb1, b1);
    not (nb2, b2);
    not (nb3, b3);

    // --- Segmento A ---
    and (w[0], nb3, nb2, nb1, b0);
    and (w[1], nb3, b2, nb1, nb0);
    and (w[2], b3, nb2, b1, b0);
    and (w[3], b3, b2, nb1, b0);
    or  (a, w[0], w[1], w[2], w[3]);

    // --- Segmento B ---
    and (w[4], nb3, b2, nb1, b0);
    and (w[5], b2, b1, nb0);
    and (w[6], b3, b1, b0);
    and (w[7], b3, b2, nb0);
    or  (b, w[4], w[5], w[6], w[7]);

    // --- Segmento C ---
    and (w[8], nb3, nb2, b1, nb0);
    and (w[9], b3, b2, nb0);
    and (w[10], b3, b2, b1);
    or  (c, w[8], w[9], w[10]);

    // --- Segmento D ---
    and (w[11], nb3, nb2, nb1, b0);
    and (w[12], nb3, b2, nb1, nb0);
    and (w[13], b2, b1, b0);
    and (w[14], b3, nb2, b1, nb0);
    or  (d, w[11], w[12], w[13], w[14]);

    // --- Segmento E ---
    and (w[15], nb3, b0);
    and (w[16], nb2, nb1, b0);
    and (w[17], nb3, b2, nb1);
    or  (e, w[15], w[16], w[17]);

    // --- Segmento F ---
    and (w[18], nb3, nb2, b0);
    and (w[19], nb3, nb2, b1);
    and (w[20], nb3, b1, b0);
    and (w[21], b3, b2, nb1, b0);
    or  (f, w[18], w[19], w[20], w[21]);

    // --- Segmento G ---
    and (w[22], nb3, nb2, nb1);
    and (w[23], nb3, b2, b1, b0);
    and (w[24], b3, b2, nb1, nb0);
    or  (g, w[22], w[23], w[24]);
endmodule

module display_hexa(
    input A0, A1, A2, A3, 
    input B0, B1, B2, B3,
	 input C0, C1, C2, C3,
    output [6:0] d1, d2, d3
);

    display_hex unidade(
        A0, A1, A2, A3,
        d1[0], d1[1], d1[2], d1[3], d1[4], d1[5], d1[6]
    );

    display_hex dezena(
        B0, B1, B2, B3,
        d2[0], d2[1], d2[2], d2[3], d2[4], d2[5], d2[6]
    );
	 
	  display_hex centena(
        C0, C1, C2, C3,
        d3[0], d3[1], d3[2], d3[3], d3[4], d3[5], d3[6]
    );	

endmodule



