
module multiplicador8bit(
    input [7:0] A, B,
    input clk, reset, start,
    output [15:0] out,
    output nq_primeira,
    output enable,
    output control
);
    wire enable_int, control_int;
    wire [7:0] Qm;         // valor de B carregado/shiftado
    wire [7:0] sum_or_0;   // entrada condicional para o somador
    wire [7:0] res_prev;   // saída registrada do somador
    wire Cout;
    wire primeira_vez_d;

    // -----------------------------------------
    // Módulo de controle alternado
    // -----------------------------------------
    modulo_controle ctrl(
        .clk(clk),
        .reset(reset),
        .enable(enable_int),
        .control(control_int)
    );

    and (enable, enable_int, start);
    and (control, control_int, start);

    // -----------------------------------------
    // Flip-flop para indicar primeira carga
    // -----------------------------------------
    d_flipflop ff_primeira(
        .q(primeira_vez_d),
        .d(1'b1),
        .clk(enable),
        .reset(reset)
    );

    and(nq_primeira, ~primeira_vez_d, start);

    // -----------------------------------------
    // Seleção de Qm: primeiro ciclo = B, depois shift
    // -----------------------------------------
    mux2x1 m0(Qm[0], out[1], B[0], nq_primeira);
    mux2x1 m1(Qm[1], out[2], B[1], nq_primeira);
    mux2x1 m2(Qm[2], out[3], B[2], nq_primeira);
    mux2x1 m3(Qm[3], out[4], B[3], nq_primeira);
    mux2x1 m4(Qm[4], out[5], B[4], nq_primeira);
    mux2x1 m5(Qm[5], out[6], B[5], nq_primeira);
    mux2x1 m6(Qm[6], out[7], B[6], nq_primeira);
    mux2x1 m7(Qm[7], out[8], B[7], nq_primeira);  // LSB do somador

    // -----------------------------------------
    // Entrada condicional do somador (A ou 0)
    // -----------------------------------------
    // Registramos o bit de controle antes do somador
    wire q1_prev;
    d_flipflop ff_q1(
        .q(q1_prev),
        .d(out[0]),
        .clk(clk),
        .reset(reset)
    );

    mux2x1 ma0(sum_or_0[0], 1'b0, A[0], q1_prev);
    mux2x1 ma1(sum_or_0[1], 1'b0, A[1], q1_prev);
    mux2x1 ma2(sum_or_0[2], 1'b0, A[2], q1_prev);
    mux2x1 ma3(sum_or_0[3], 1'b0, A[3], q1_prev);
    mux2x1 ma4(sum_or_0[4], 1'b0, A[4], q1_prev);
    mux2x1 ma5(sum_or_0[5], 1'b0, A[5], q1_prev);
    mux2x1 ma6(sum_or_0[6], 1'b0, A[6], q1_prev);
    mux2x1 ma7(sum_or_0[7], 1'b0, A[7], q1_prev);

    // -----------------------------------------
    // Somador 8 bits
    // -----------------------------------------
    sum8bit sum_mult(Cout, res_prev, sum_or_0, out[15:8]);

    // -----------------------------------------
    // Registrador universal: combina saída do somador + Qm
    // -----------------------------------------
    universal_register ur(
        1'b0,                         // entrada serial
        {Cout, res_prev, Qm},         // entradas paralelas
        enable,                        // enable do registrador
        out,                           // saída
        control,                       // controle do mux interno
        reset
    );
endmodule
