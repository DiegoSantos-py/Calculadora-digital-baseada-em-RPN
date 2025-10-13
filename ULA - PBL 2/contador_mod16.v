module contador_mod16(
    input en,
    input reset,
    output out_0, out_1, out_2, out_3
);
    
    wire not_out0, not_out1, not_out2, not_out3;
    
    // Portas NOT para cada bit
    not not0(not_out0, out_0);
    not not1(not_out1, out_1);
    not not2(not_out2, out_2);
    not not3(not_out3, out_3);
    
    // Flip-flops com saídas individuais
    d_flipflop dff0 (.q(out_0), .d(not_out0), .reset(reset), .clk(en));
    d_flipflop dff1 (.q(out_1), .d(not_out1), .reset(reset), .clk(not_out0));
    d_flipflop dff2 (.q(out_2), .d(not_out2), .reset(reset), .clk(not_out1));
    d_flipflop dff3 (.q(out_3), .d(not_out3), .reset(reset), .clk(not_out2));
     
endmodule

