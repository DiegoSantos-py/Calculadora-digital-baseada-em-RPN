module modulo_controle(
    input clk,
    input reset,
    output enable,   // Ativo em clocks 1,3,5,...
    output control   // Ativo em clocks 2,4,6,...
);
    wire nq0, q1, nq1;

    // Primeiro flip-flop: Q vai direto para a saída `enable`
    not(nq0, enable);
    d_flipflop ff0(
        .q(enable),     // Q do FF0 dirige diretamente a saída enable
        .d(nq0),
        .clk(clk),
        .reset(reset)
    );

    // Segundo flip-flop: gera q1
    not(nq1, q1);
    d_flipflop ff1(
        .q(q1),
        .d(nq1),
        .clk(enable),   // avança a cada mudança de enable (mesma ideia do clk = q0)
        .reset(reset)
    );

    // control nos clocks pares: control = q1 & ~enable
    and(control, q1, nq0);
endmodule


module modulo_controle1(
    input clk,
    input reset,
	 input [15:0] A,
	 output [16:0] out,
    output enable,   // Ativo em clocks 1,3,5,...
    output control   // Ativo em clocks 2,4,6,...
);
   // Primeiro flip-flop: Q vai direto para a saída `enable`
    not(nq0, enable);
    d_flipflop ff0(
        .q(enable),     // Q do FF0 dirige diretamente a saída enable
        .d(nq0),
        .clk(clk),
        .reset(reset)
    );

    // Segundo flip-flop: gera q1
    not(nq1, q1);
    d_flipflop ff1(
        .q(q1),
        .d(nq1),
        .clk(enable),   // avança a cada mudança de enable (mesma ideia do clk = q0)
        .reset(reset)
    );

    // control nos clocks pares: control = q1 & ~enable
    and(control, q1, nq0);
	 
	 universal_register ur1(
        1'b1,
        {A},
        enable, out, control, reset);
endmodule