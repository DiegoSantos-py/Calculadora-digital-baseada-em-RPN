module universal_register(
    input in_serie,
    input [16:0] in_paralelo,
    input en,
    output [16:0] out,
    input control,
    input reset
);
    wire [16:0] data;

    // Último FF recebe a entrada serial ou o paralelo
    mux2x1 mux16(data[16], in_paralelo[16], in_serie, control);
    d_flipflop dff16(.q(out[16]), .d(data[16]), .clk(en), .reset(reset));

    mux2x1 mux15(data[15], in_paralelo[15], out[16], control);
    d_flipflop dff15(.q(out[15]), .d(data[15]), .clk(en), .reset(reset));

    mux2x1 mux14(data[14], in_paralelo[14], out[15], control);
    d_flipflop dff14(.q(out[14]), .d(data[14]), .clk(en), .reset(reset));

    mux2x1 mux13(data[13], in_paralelo[13], out[14], control);
    d_flipflop dff13(.q(out[13]), .d(data[13]), .clk(en), .reset(reset));

    mux2x1 mux12(data[12], in_paralelo[12], out[13], control);
    d_flipflop dff12(.q(out[12]), .d(data[12]), .clk(en), .reset(reset));

    mux2x1 mux11(data[11], in_paralelo[11], out[12], control);
    d_flipflop dff11(.q(out[11]), .d(data[11]), .clk(en), .reset(reset));

    mux2x1 mux10(data[10], in_paralelo[10], out[11], control);
    d_flipflop dff10(.q(out[10]), .d(data[10]), .clk(en), .reset(reset));

    mux2x1 mux9(data[9], in_paralelo[9], out[10], control);
    d_flipflop dff9(.q(out[9]), .d(data[9]), .clk(en), .reset(reset));

    mux2x1 mux8(data[8], in_paralelo[8], out[9], control);
    d_flipflop dff8(.q(out[8]), .d(data[8]), .clk(en), .reset(reset));

    mux2x1 mux7(data[7], in_paralelo[7], out[8], control);
    d_flipflop dff7(.q(out[7]), .d(data[7]), .clk(en), .reset(reset));

    mux2x1 mux6(data[6], in_paralelo[6], out[7], control);
    d_flipflop dff6(.q(out[6]), .d(data[6]), .clk(en), .reset(reset));

    mux2x1 mux5(data[5], in_paralelo[5], out[6], control);
    d_flipflop dff5(.q(out[5]), .d(data[5]), .clk(en), .reset(reset));

    mux2x1 mux4(data[4], in_paralelo[4], out[5], control);
    d_flipflop dff4(.q(out[4]), .d(data[4]), .clk(en), .reset(reset));

    mux2x1 mux3(data[3], in_paralelo[3], out[4], control);
    d_flipflop dff3(.q(out[3]), .d(data[3]), .clk(en), .reset(reset));

    mux2x1 mux2(data[2], in_paralelo[2], out[3], control);
    d_flipflop dff2(.q(out[2]), .d(data[2]), .clk(en), .reset(reset));

    mux2x1 mux1(data[1], in_paralelo[1], out[2], control);
    d_flipflop dff1(.q(out[1]), .d(data[1]), .clk(en), .reset(reset));

    mux2x1 mux0(data[0], in_paralelo[0], out[1], control);
    d_flipflop dff0(.q(out[0]), .d(data[0]), .clk(en), .reset(reset));
endmodule
