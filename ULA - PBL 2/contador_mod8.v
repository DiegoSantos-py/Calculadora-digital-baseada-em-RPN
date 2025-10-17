module contador_mod8(
    input en,
    input reset,
    output out_0, out_1, out_2
);
    
    wire not_out0, not_out1, not_out2;
    
    // Portas NOT para cada bit
    not not0(not_out0, out_0);
    not not1(not_out1, out_1);
    not not2(not_out2, out_2);
    
    // Flip-flops configurados para contagem decrescente
    d_flipflop dff0 (.q(out_0), .d(not_out0), .reset(reset), .clk(en));
    d_flipflop dff1 (.q(out_1), .d(not_out1), .reset(reset), .clk(out_0));   
    d_flipflop dff2 (.q(out_2), .d(not_out2), .reset(reset), .clk(out_1));  
endmodule
