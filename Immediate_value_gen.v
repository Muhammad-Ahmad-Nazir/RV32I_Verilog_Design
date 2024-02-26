`timescale 1ns / 1ns

module Immediate_value_gen(Imm_gen_input, I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en, Imm_gen_output);

input [19:0] Imm_gen_input;
input I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en;
output reg [31:0] Imm_gen_output;

always @(*)        //final = {n{name[bit]}} - set bit of name in final n times
begin
	if (I_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (L_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (S_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (B_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (J_type_en)
	begin
		Imm_gen_output = { 11'd0, {Imm_gen_input[19:0]}, 1'd0};
	end
	
	if (U_type_en)
	begin
		Imm_gen_output = { {Imm_gen_input[19:0]}, 12'd0 };
	end

end

endmodule