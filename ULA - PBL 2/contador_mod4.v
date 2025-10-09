module contador_mod4(en, out);
    input en;
    output [1:0] out;

    wire not_out0;
    wire xor_out;

    not not0(not_out0, out[0]);            // next0 = ~Q0
    xor xor1(xor_out, out[1], out[0]);     // next1 = Q1 ^ Q0

    // ambos clockados por 'en' (síncrono)
    d_flipflop dff0 (.q(out[0]), .d(not_out0), .reset(1'b0), .clk(en));
    d_flipflop dff1 (.q(out[1]), .d(xor_out),   .reset(1'b0), .clk(en));
endmodule