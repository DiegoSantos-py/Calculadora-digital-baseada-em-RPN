module top(
    input clk,          
    input switch_in,    
    input [7:0] data_in, // dados de entrada para o shift register
	 output [7:0] out1, out2, out3,
    output execute);
	 
    wire pulse_en;  // pulso único do debouncer

    // ===== Debouncer do switch =====
    switch_debouncer deb(
        .clk(clk),
		  .reset(1'b0),
        .botao_raw(switch_in),
        .botao_ok(pulse_en)   // pulso único, seguro como enable
    );

    // ===== Shift register =====
    shift_register sr(
        .in(data_in),
        .en(pulse_en),     // enable vindo do debouncer
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .execute(execute),
    );

endmodule