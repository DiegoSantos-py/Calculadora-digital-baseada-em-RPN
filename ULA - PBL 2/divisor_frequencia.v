module dividir_5(clk, clk_out);
    input clk;
    output clk_out;
    wire reset;
    wire [2:0] q;
    wire nq0, nq1, nq2;

    // Inversores
    not Not0(nq0, q[0]);
    not Not1(nq1, q[1]);
	 not Not2(nq2, q[2]);
	 
    // Flip-flops com lógica estrutural
    d_flipflop b0(.q(q[0]), .d(nq0), .reset(reset), .clk(clk));
    d_flipflop b1(.q(q[1]), .d(nq1), .reset(reset), .clk(nq0));
    d_flipflop b2(.q(q[2]), .d(nq2), .reset(reset), .clk(nq1));

    // Lógica estrutural
    and And0(reset, q[0], q[2]);
    and And1(clk_out, q[2], 1'b1);  // substitui assign

endmodule


module divisor_frequencia(
    input clk,
    output clk_out, clk_aux, clk_botao
);
    wire [6:0] out;
    wire [5:0] q;

    // Inversores para lógica estrutural (substitui "~")
    wire nq0, nq1, nq2, n_clk_out;
    not N0(nq0, q[0]);
    not N1(nq1, q[1]);
    not N2(nq2, q[2]);
    not N3(n_clk_out, clk_out);

    // 6 divisores por 5 em cascata
    dividir_5 div1 (.clk(clk),     .clk_out(out[1]));
    dividir_5 div2 (.clk(out[1]),  .clk_out(out[2]));
    dividir_5 div3 (.clk(out[2]),  .clk_out(out[3]));
    dividir_5 div4 (.clk(out[3]),  .clk_out(out[4]));
    dividir_5 div5 (.clk(out[4]),  .clk_out(out[5]));
	 dividir_5 div6 (.clk(out[4]),  .clk_out(out[6]));
	 
    // Flip-flops finais para gerar clocks auxiliares e principal
    d_flipflop div7 (.q(q[0]), .d(nq0),       .reset(1'b0), .clk(out[6]));
    d_flipflop div8 (.q(q[1]), .d(nq1),       .reset(1'b0), .clk(nq0));
    d_flipflop div9 (.q(q[2]), .d(nq2),       .reset(1'b0), .clk(nq1));
    d_flipflop div10(.q(clk_out), .d(n_clk_out), .reset(1'b0), .clk(nq2));

    // Clocks auxiliares para debounce — usando lógica estrutural
    and And1(clk_aux, q[0], 1'b1);
    and And2(clk_botao, q[1], 1'b1);

endmodule
