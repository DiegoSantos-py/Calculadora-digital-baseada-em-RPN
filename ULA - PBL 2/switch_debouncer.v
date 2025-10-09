module switch_debouncer(
    input clk,          // clock interno da FPGA
    input switch_raw,   // sinal direto do switch
    output pulse        // pulso único por ativação
);

    wire sync0, sync1;  // FFs de sincronização
    wire prev_sync1;    // FF que guarda estado anterior
    wire not_prev;      

    // ===== sincronização do switch =====
    d_flipflop ff0(.q(sync0), .d(switch_raw), .reset(1'b0), .clk(clk));
    d_flipflop ff1(.q(sync1), .d(sync0), .reset(1'b0), .clk(clk));

    // ===== FF que guarda estado anterior do switch =====
    d_flipflop ff_prev(.q(prev_sync1), .d(sync1), .reset(1'b0), .clk(clk));

    // ===== pulso único: sobe apenas na transição 0 -> 1 =====
    not not_prev_gate(not_prev, prev_sync1);
    and and_pulse(pulse, sync1, not_prev);

endmodule
