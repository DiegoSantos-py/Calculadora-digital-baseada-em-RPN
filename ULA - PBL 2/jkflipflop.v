module jkflipflop (
     input wire j,
    input wire k,
    input wire clk,
    input wire clrn,  // clear assíncrono (active low)
    input wire prn,   // preset assíncrono (active low)
    output wire q
);

// Instanciando flip-flop JK nativo
jkff jkff_inst (
    .j(j),
    .k(k),
    .clk(clk),
    .clrn(clrn),
    .prn(prn),
    .q(q)
);

endmodule