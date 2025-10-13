module switch_debouncer(
    input wire clk,   // clock principal da FPGA
    input wire reset,
    input wire botao_raw,   // botão com bounce
    output wire botao_ok    // botão estável
);
    wire clk_out, clk_aux, clk_botao;

    // 1️⃣Gera clocks lentos
    divisor_frequencia div_inst(
        .clk(clk),
        .clk_out(clk_out),
        .clk_aux(clk_aux),
        .clk_botao(clk_botao)
    );

    // 2️⃣Sincroniza o botão no clock lento
    wire botao_sync;
    d_flipflop sync1(
        .d(botao_raw),
        .clk(clk_botao),   // clock bem mais lento (~32Hz)
        .reset(reset),
        .q(botao_sync)
    );

    // 3️⃣Saída estável
    d_flipflop stable(
        .d(botao_sync),
        .clk(clk_botao),
        .reset(reset),
        .q(botao_ok)
    );
endmodule