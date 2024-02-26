`timescale 1ns / 1ns

module ALU(Register1_value, Register2_value, ALU_sel, ALU_output);

input [3:0] ALU_sel;
input [31:0] Register1_value, Register2_value;
output reg [31:0] ALU_output;

always@(*)
begin
	
	case(ALU_sel)
		4'd0:	ALU_output = Register1_value + Register2_value;
		4'd1:	ALU_output = Register1_value - Register2_value;
		4'd2:	ALU_output = Register1_value << Register2_value;
		4'd3:	ALU_output = ($signed(Register1_value) < $signed(Register2_value));
		4'd4:	ALU_output = Register1_value < Register2_value;
		4'd5:	ALU_output = Register1_value ^ Register2_value;
		4'd6:	ALU_output = Register1_value >> Register2_value;
		4'd7:	ALU_output = Register1_value >>> Register2_value;
		4'd8:	ALU_output = Register1_value | Register2_value;
		4'd9:	ALU_output = Register1_value & Register2_value;
	endcase
end

endmodule