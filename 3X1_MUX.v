`timescale 1ns / 1ns

module MUX_3X1 ( in1, in2, in3, selection_bits, out);

input [31:0] in1, in2, in3;
input [1:0] selection_bits;
output reg [31:0] out;

always @(*)
begin
	if (selection_bits == 2'b00)
		out = in1;
	else if (selection_bits == 2'b01)
		out = in2;
	else if (selection_bits == 2'b10)
		out = in3;
		
end

endmodule
