module mux_shiftregister(out, in, sel);
	input in;
	input [1:0]sel;
	output out;
	wire out_temp;
	
	not notsel0(nsel, sel[0]);
	and(out_temp, in, nsel0, sel[1]);
	
endmodule


