module contador_mod255(
    input en,
    input reset,
    output out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7
);
    
    wire not_out0, not_out1, not_out2, not_out3, not_out4, not_out5, not_out6, not_out7;
    
    // Portas NOT para cada bit
    not not0(not_out0, out_0);
    not not1(not_out1, out_1);
    not not2(not_out2, out_2);
    not not3(not_out3, out_3);
    not not4(not_out4, out_4);
    not not5(not_out5, out_5);
    not not6(not_out6, out_6);
    not not7(not_out7, out_7);
	 
    // Flip-flops com saídas individuais
    d_flipflop dff0 (.q(out_0), .d(not_out0), .reset(reset), .clk(en));
    d_flipflop dff1 (.q(out_1), .d(not_out1), .reset(reset), .clk(not_out0));
    d_flipflop dff2 (.q(out_2), .d(not_out2), .reset(reset), .clk(not_out1));
    d_flipflop dff3 (.q(out_3), .d(not_out3), .reset(reset), .clk(not_out2));
	 d_flipflop dff4 (.q(out_4), .d(not_out4), .reset(reset), .clk(not_out3));
    d_flipflop dff5 (.q(out_5), .d(not_out5), .reset(reset), .clk(not_out4));
    d_flipflop dff6 (.q(out_6), .d(not_out6), .reset(reset), .clk(not_out5));
    d_flipflop dff7 (.q(out_7), .d(not_out7), .reset(reset), .clk(not_out6));
	 
endmodule