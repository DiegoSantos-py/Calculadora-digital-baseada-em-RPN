module multiplicador_alternativo(
    input clk,
    input reset,
    input start,
    input [7:0] A, B,
    output [15:0] out
);
    wire [15:0] acc, acc_next;
    wire [7:0] count;
    wire carry;
    wire enable_acc, cont_enable;
    wire count_done;
	 wire done;
	 
    // -------------------------------------
    // Contador até 255
    // -------------------------------------
    contador_mod255 ctr(
        .en(cont_enable),
        .reset(reset),
        .out_0(count[0]),
        .out_1(count[1]),
        .out_2(count[2]),
        .out_3(count[3]),
        .out_4(count[4]),
        .out_5(count[5]),
        .out_6(count[6]),
        .out_7(count[7])
    );

    // -------------------------------------
    // Comparador para parar quando count == B
    // -------------------------------------
    comparador_8bit cmp(
        .equal(count_done),
        .A(count),
        .B(B)
    );

    // -------------------------------------
    // Somador de 16 bits: acc_next = acc + A
    // -------------------------------------
    sum16bit sum(
        .Cout(carry),
        .S(acc_next),
        .A(acc),
        .B({8'b0, A}) // extendendo A para 16 bits
    );

    // -------------------------------------
    // Registrador de acumulador (16 bits)
    // -------------------------------------
    // enable interno: start ativo e contador ainda não terminou
	 wire ndone;
	 not(ndone, count_done);
    and(enable_acc, start, ndone, clk);

    register_16bit reg_acc(
        .in(acc_next),
        .en(enable_acc),
        .out(acc),
        .reset(reset)
    );

    // -------------------------------------
    // Saída
    // -------------------------------------
    wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;
    and(out[0], acc[0], done);
    and(out[1], acc[1], done);
    and(out[2], acc[2], done);
    and(out[3], acc[3], done);
    and(out[4], acc[4], done);
    and(out[5], acc[5], done);
    and(out[6], acc[6], done);
    and(out[7], acc[7], done);
    and(out[8], acc[8], done);
    and(out[9], acc[9], done);
    and(out[10], acc[10], done);
    and(out[11], acc[11], done);
    and(out[12], acc[12], done);
    and(out[13], acc[13], done);
    and(out[14], acc[14], done);
    and(out[15], acc[15], done);

    // -------------------------------------
    // Enable do contador
    // -------------------------------------
    or(cont_enable, enable_acc, 1'b0);

    // done = 1 quando contador atingir B
    not(done, ndone); 
endmodule

