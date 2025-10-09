module top(
    input clk,          // clock interno da FPGA (ex.: 50 MHz)
    input switch_in,    // switch físico para inserir valores
    input [7:0] data_in, // dados de entrada para o shift register
    output [7:0] out1, out2, out3,
    output execute);
	 
	 
    wire pulse_en;  // pulso único do debouncer

    // ===== Debouncer do switch =====
    switch_debouncer deb(
        .clk(clk),
        .switch_raw(switch_in),
        .pulse(pulse_en)   // pulso único, seguro como enable
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
