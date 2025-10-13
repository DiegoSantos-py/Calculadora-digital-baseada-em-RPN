module dividir_5(clk, clk_out);
	input clk;
	output clk_out;
	wire reset;
	wire [2:0] q;
	
	d_flipflop b0(.q(q[0]),.d(~q[0]),.reset(reset),.clk(clk));
	d_flipflop b1(.q(q[1]),.d(~q[1]),.reset(reset),.clk(~q[0]));
	d_flipflop b2(.q(q[2]),.d(~q[2]),.reset(reset),.clk(~q[1]));

	and And0(reset, q[0], q[2]);
	assign clk_out = q[2];
endmodule

module divisor_frequencia(
    input clk,
    output clk_out, clk_aux, clk_botao
);
    wire [6:0] out;
    wire [5:0] q;

    // 6 divisores por 5 em cascata
    dividir_5 div1 (.clk(clk),    .clk_out(out[1]));
    dividir_5 div2 (.clk(out[1]),.clk_out(out[2]));
    dividir_5 div3 (.clk(out[2]),.clk_out(out[3]));
    dividir_5 div4 (.clk(out[3]),.clk_out(out[4]));
    dividir_5 div5 (.clk(out[4]),.clk_out(out[5]));
    dividir_5 div6 (.clk(out[5]),.clk_out(out[6]));

    // Flip-flops finais para gerar clocks auxiliares e principal
    d_flipflop div7(.q(q[0]), .d(~q[0]), .reset(1'b0), .clk(out[6]));
    d_flipflop div8(.q(q[1]), .d(~q[1]), .reset(1'b0), .clk(~q[0]));
    d_flipflop div9(.q(q[2]), .d(~q[2]), .reset(1'b0), .clk(~q[1]));
    d_flipflop div10(.q(clk_out), .d(~clk_out), .reset(1'b0), .clk(~q[2]));

    // Clocks auxiliares para debounce
    assign clk_aux   = q[0];  // mais rápido
    assign clk_botao = q[1];  // para amostragem do botão

endmodule