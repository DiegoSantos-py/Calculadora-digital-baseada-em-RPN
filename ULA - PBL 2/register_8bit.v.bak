module register_8bit(in, en, out);
    input [7:0] in;
    input en; // Enable - Vai carregar o valor nos flipflops
    output [7:0] out;
	  
	 // Register formado  por 8 flip flops do tipo D
    d_flipflop dff0 (.q(out[0]), .d(in[0]), .reset(1'b0), .clk(en));
    d_flipflop dff1 (.q(out[1]), .d(in[1]), .reset(1'b0), .clk(en));
    d_flipflop dff2 (.q(out[2]), .d(in[2]), .reset(1'b0), .clk(en));
    d_flipflop dff3 (.q(out[3]), .d(in[3]), .reset(1'b0), .clk(en));
    d_flipflop dff4 (.q(out[4]), .d(in[4]), .reset(1'b0), .clk(en));
    d_flipflop dff5 (.q(out[5]), .d(in[5]), .reset(1'b0), .clk(en));
    d_flipflop dff6 (.q(out[6]), .d(in[6]), .reset(1'b0), .clk(en));
    d_flipflop dff7 (.q(out[7]), .d(in[7]), .reset(1'b0), .clk(en));
    
endmodule