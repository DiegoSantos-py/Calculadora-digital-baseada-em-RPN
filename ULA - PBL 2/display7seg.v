module display7seg(
    input [15:0] Data,
    input [1:0] sel,
    output [6:0] d1, d2, d3, d4
);

    // -------------------------
    // Fios para saídas de cada decodificador
    // -------------------------
    wire [15:0] display_decimal, display_hexa, display_octal;
    wire [6:0] dec_d1, dec_d2, dec_d3, dec_d4;  // decimal
    wire [6:0] hex_d1, hex_d2, hex_d3, hex_d4;  // hexadecimal
    wire [6:0] oct_d1, oct_d2, oct_d3, oct_d4;  // octal

    // -------------------------
    // Chamada dos decodificadores
    // -------------------------

    // Conectar decodificadores aos fios por display
    display_decimal({3'b00, Data}, {dec_d4[6], dec_d4[5], dec_d4[4], dec_d4[3], dec_d4[2], dec_d4[1], dec_d4[0],
	 dec_d3[6], dec_d3[5], dec_d3[4], dec_d3[3], dec_d3[2], dec_d3[1], dec_d3[0],
	 dec_d2[6], dec_d2[5], dec_d2[4], dec_d2[3], dec_d2[2], dec_d2[1], dec_d2[0],
	 dec_d1[6], dec_d1[5], dec_d1[4], dec_d1[3], dec_d1[2], dec_d1[1], dec_d1[0]});

    display_hexa(Data[0], Data[1], Data[2], Data[3],
                 Data[4], Data[5], Data[6], Data[7], 
					  Data[8], Data[9], Data[10], Data[11],
                 hex_d1, hex_d2, hex_d3); 

    display_octal(.A0(Data[0]), .A1(Data[1]), .A2(Data[2]), 
                  .B0(Data[3]), .B1(Data[4]), .B2(Data[5]), 
						.C0(Data[6]),.C1(Data[7]), .C2(Data[8]), 
						.D0(Data[9]), .D1(Data[10]), .D2(Data[11]), 
						.E0(Data[12]), .E1(Data[13]), .E2(Data[14]),
                  .F0(Data[15]), .F1(1'B0), .F2(1'B0), 
						.d1(oct_d1), .d2(oct_d2), .d3(oct_d3), 
						.d4(oct_d4));

    // -------------------------
    // Fios de seleção
    // -------------------------
wire sel_decimal, sel_hexa, sel_octal;
    wire not_sel0, not_sel1;

    not (not_sel0, sel[0]);
    not (not_sel1, sel[1]);
	 
    and (sel_decimal, sel[1], sel[0]);  // 11
    and (sel_hexa, not_sel1, sel[0]);       // 01
    and (sel_octal, sel[1], not_sel0);      // 10

    wire [6:0] d1_and_dec, d1_and_hex, d1_and_oct;
    and (d1_and_dec[0], dec_d1[0], sel_decimal);
    and (d1_and_hex[0], hex_d1[0], sel_hexa);
    and (d1_and_oct[0], oct_d1[0], sel_octal);
    or  (d1[0], d1_and_dec[0], d1_and_hex[0], d1_and_oct[0]);

    and (d1_and_dec[1], dec_d1[1], sel_decimal);
    and (d1_and_hex[1], hex_d1[1], sel_hexa);
    and (d1_and_oct[1], oct_d1[1], sel_octal);
    or  (d1[1], d1_and_dec[1], d1_and_hex[1], d1_and_oct[1]);

    and (d1_and_dec[2], dec_d1[2], sel_decimal);
    and (d1_and_hex[2], hex_d1[2], sel_hexa);
    and (d1_and_oct[2], oct_d1[2], sel_octal);
    or  (d1[2], d1_and_dec[2], d1_and_hex[2], d1_and_oct[2]);

    and (d1_and_dec[3], dec_d1[3], sel_decimal);
    and (d1_and_hex[3], hex_d1[3], sel_hexa);
    and (d1_and_oct[3], oct_d1[3], sel_octal);
    or  (d1[3], d1_and_dec[3], d1_and_hex[3], d1_and_oct[3]);

    and (d1_and_dec[4], dec_d1[4], sel_decimal);
    and (d1_and_hex[4], hex_d1[4], sel_hexa);
    and (d1_and_oct[4], oct_d1[4], sel_octal);
    or  (d1[4], d1_and_dec[4], d1_and_hex[4], d1_and_oct[4]);

    and (d1_and_dec[5], dec_d1[5], sel_decimal);
    and (d1_and_hex[5], hex_d1[5], sel_hexa);
    and (d1_and_oct[5], oct_d1[5], sel_octal);
    or  (d1[5], d1_and_dec[5], d1_and_hex[5], d1_and_oct[5]);

    and (d1_and_dec[6], dec_d1[6], sel_decimal);
    and (d1_and_hex[6], hex_d1[6], sel_hexa);
    and (d1_and_oct[6], oct_d1[6], sel_octal);
    or  (d1[6], d1_and_dec[6], d1_and_hex[6], d1_and_oct[6]);

	wire [6:0] d2_and_dec, d2_and_hex, d2_and_oct;

	and (d2_and_dec[0], dec_d2[0], sel_decimal);
	and (d2_and_hex[0], hex_d2[0], sel_hexa);
	and (d2_and_oct[0], oct_d2[0], sel_octal);
	or  (d2[0], d2_and_dec[0], d2_and_hex[0], d2_and_oct[0]);

	and (d2_and_dec[1], dec_d2[1], sel_decimal);
	and (d2_and_hex[1], hex_d2[1], sel_hexa);
	and (d2_and_oct[1], oct_d2[1], sel_octal);
	or  (d2[1], d2_and_dec[1], d2_and_hex[1], d2_and_oct[1]);

	and (d2_and_dec[2], dec_d2[2], sel_decimal);
	and (d2_and_hex[2], hex_d2[2], sel_hexa);
	and (d2_and_oct[2], oct_d2[2], sel_octal);
	or  (d2[2], d2_and_dec[2], d2_and_hex[2], d2_and_oct[2]);

	and (d2_and_dec[3], dec_d2[3], sel_decimal);
	and (d2_and_hex[3], hex_d2[3], sel_hexa);
	and (d2_and_oct[3], oct_d2[3], sel_octal);
	or  (d2[3], d2_and_dec[3], d2_and_hex[3], d2_and_oct[3]);

	and (d2_and_dec[4], dec_d2[4], sel_decimal);
	and (d2_and_hex[4], hex_d2[4], sel_hexa);
	and (d2_and_oct[4], oct_d2[4], sel_octal);
	or  (d2[4], d2_and_dec[4], d2_and_hex[4], d2_and_oct[4]);

	and (d2_and_dec[5], dec_d2[5], sel_decimal);
	and (d2_and_hex[5], hex_d2[5], sel_hexa);
	and (d2_and_oct[5], oct_d2[5], sel_octal);
	or  (d2[5], d2_and_dec[5], d2_and_hex[5], d2_and_oct[5]);

	and (d2_and_dec[6], dec_d2[6], sel_decimal);
	and (d2_and_hex[6], hex_d2[6], sel_hexa);
	and (d2_and_oct[6], oct_d2[6], sel_octal);
	or  (d2[6], d2_and_dec[6], d2_and_hex[6], d2_and_oct[6]);
	
	wire [6:0] d3_and_dec, d3_and_hex, d3_and_oct;

	and (d3_and_dec[0], dec_d3[0], sel_decimal);
	and (d3_and_hex[0], hex_d3[0], sel_hexa);
	and (d3_and_oct[0], oct_d3[0], sel_octal);
	or  (d3[0], d3_and_dec[0], d3_and_hex[0], d3_and_oct[0]);

	and (d3_and_dec[1], dec_d3[1], sel_decimal);
	and (d3_and_hex[1], hex_d3[1], sel_hexa);
	and (d3_and_oct[1], oct_d3[1], sel_octal);
	or  (d3[1], d3_and_dec[1], d3_and_hex[1], d3_and_oct[1]);

	and (d3_and_dec[2], dec_d3[2], sel_decimal);
	and (d3_and_hex[2], hex_d3[2], sel_hexa);
	and (d3_and_oct[2], oct_d3[2], sel_octal);
	or  (d3[2], d3_and_dec[2], d3_and_hex[2], d3_and_oct[2]);

	and (d3_and_dec[3], dec_d3[3], sel_decimal);
	and (d3_and_hex[3], hex_d3[3], sel_hexa);
	and (d3_and_oct[3], oct_d3[3], sel_octal);
	or  (d3[3], d3_and_dec[3], d3_and_hex[3], d3_and_oct[3]);

	and (d3_and_dec[4], dec_d3[4], sel_decimal);
	and (d3_and_hex[4], hex_d3[4], sel_hexa);
	and (d3_and_oct[4], oct_d3[4], sel_octal);
	or  (d3[4], d3_and_dec[4], d3_and_hex[4], d3_and_oct[4]);

	and (d3_and_dec[5], dec_d3[5], sel_decimal);
	and (d3_and_hex[5], hex_d3[5], sel_hexa);
	and (d3_and_oct[5], oct_d3[5], sel_octal);
	or  (d3[5], d3_and_dec[5], d3_and_hex[5], d3_and_oct[5]);

	and (d3_and_dec[6], dec_d3[6], sel_decimal);
	and (d3_and_hex[6], hex_d3[6], sel_hexa);
	and (d3_and_oct[6], oct_d3[6], sel_octal);
	or  (d3[6], d3_and_dec[6], d3_and_hex[6], d3_and_oct[6]);

	wire [6:0] d4_and_dec, d4_and_hex, d4_and_oct;

	and (d4_and_dec[0], dec_d4[0], sel_decimal);
	and (d4_and_hex[0], hex_d4[0], sel_hexa);
	and (d4_and_oct[0], oct_d4[0], sel_octal);
	or  (d4[0], d4_and_dec[0], d4_and_hex[0], d4_and_oct[0]);

	and (d4_and_dec[1], dec_d4[1], sel_decimal);
	and (d4_and_hex[1], hex_d4[1], sel_hexa);
	and (d4_and_oct[1], oct_d4[1], sel_octal);
	or  (d4[1], d4_and_dec[1], d4_and_hex[1], d4_and_oct[1]);

	and (d4_and_dec[2], dec_d4[2], sel_decimal);
	and (d4_and_hex[2], hex_d4[2], sel_hexa);
	and (d4_and_oct[2], oct_d4[2], sel_octal);
	or  (d4[2], d4_and_dec[2], d4_and_hex[2], d4_and_oct[2]);

	and (d4_and_dec[3], dec_d4[3], sel_decimal);
	and (d4_and_hex[3], hex_d4[3], sel_hexa);
	and (d4_and_oct[3], oct_d4[3], sel_octal);
	or  (d4[3], d4_and_dec[3], d4_and_hex[3], d4_and_oct[3]);

	and (d4_and_dec[4], dec_d4[4], sel_decimal);
	and (d4_and_hex[4], hex_d4[4], sel_hexa);
	and (d4_and_oct[4], oct_d4[4], sel_octal);
	or  (d4[4], d4_and_dec[4], d4_and_hex[4], d4_and_oct[4]);

	and (d4_and_dec[5], dec_d4[5], sel_decimal);
	and (d4_and_hex[5], hex_d4[5], sel_hexa);
	and (d4_and_oct[5], oct_d4[5], sel_octal);
	or  (d4[5], d4_and_dec[5], d4_and_hex[5], d4_and_oct[5]);

	and (d4_and_dec[6], dec_d4[6], sel_decimal);
	and (d4_and_hex[6], 1'b1, sel_hexa);
	and (d4_and_oct[6], oct_d4[6], sel_octal);
	or  (d4[6], d4_and_dec[6], d4_and_hex[6], d4_and_oct[6]);
endmodule
