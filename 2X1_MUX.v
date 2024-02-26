`timescale 1ns / 1ns

module MUX_2X1( in1, in2, selection_bit, out);

input [31:0] in1, in2;
input selection_bit;
output reg [31:0] out;

always @(*)
begin
	if (selection_bit)
		out = in2;
	else
		out = in1;
end

endmodule