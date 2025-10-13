module shift_register(in, en, out1, out2, out3, execute);
    input  [7:0] in;
    input        en;
    output [7:0] out1, out2, out3;
    output       execute;
    wire [1:0] counter;

    // ===== Declarações =====
    wire not_c0, not_c1;
    wire is_2;

    // ===== Registradores de dados =====
    register_8bit reg1(.in(in),   .en(en), .out(out1), .reset(1'b0));
    register_8bit reg2(.in(out1), .en(en), .out(out2), .reset(1'b0));
    register_8bit reg3(.in(out2), .en(en), .out(out3), .reset(1'b0));

    // ===== Contador mod4 (síncrono) =====
    contador_mod4 shift_register_counter(.en(en), .out(counter));

    // ===== Detecta estado anterior ao 3 =====
    not not_c0_gate(not_c0, counter[0]);
    and and_is2(is_2, counter[1], not_c0);   // contador = 10 (decimal 2)

    // ===== Flip-flop de execute =====
    // D = 1 apenas quando contador = 2
    d_flipflop dff_execute(.q(execute), .d(is_2), .reset(1'b0), .clk(en));

endmodule


	
	