`timescale 1ns / 1ns

module RISCV( clk_in, Test_variable);

input clk_in;
output reg [15:0] Test_variable;

//Setting intermodule connection wires
wire clk;
wire [31:0] PC_added_4;
wire [31:0] ALU_result;
wire [31:0] PC_input;
wire [31:0] PC_out;
wire [31:0] Instruction_code;
wire PC_sel;
//reg reset;
wire [4:0] sr1, sr2, rd;
wire [19:0] imm_gen_in;
wire [3:0] alu_selection;
wire reg_write_en;
wire mem_write_en;
wire I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en;
wire A_sel, B_sel;
wire BrLT, BrEq, BrUn;
wire [2:0] load_type;
wire [1:0] store_type, WB_sel;
wire [31:0] sr1_data, sr2_data;
wire [31:0] write_back;
wire [31:0] Reg_4;
wire [31:0] imm_gen_out;
wire [31:0] alu_input1;
wire [31:0] alu_input2;
wire [31:0] data_mem_out;
//

//initial
//begin
//	reset = 0;
//end


//Module calling according to procedure

Clock_divider CLD( clk_in, clk);

MUX_2X1 mux_pc_input( PC_added_4, ALU_result, PC_sel, PC_input);

Program_Counter PC1( clk, PC_input, PC_out);

Program_Counter_ALU PCadd1( PC_out, PC_added_4);

Program_memory PM1( PC_out, Instruction_code);

CU cu1(Instruction_code, sr1, sr2, imm_gen_in, rd, alu_selection, reg_write_en, mem_write_en, I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en, A_sel, B_sel, BrLT, BrEq, BrUn, load_type, store_type, WB_sel);

Register_file RF1( sr1, sr2, rd, clk, sr1_data, sr2_data, reg_write_en, write_back_mux_result, Reg_4);

Immediate_value_gen IVG1( imm_gen_in, I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en, imm_gen_out);

MUX_2X1 alu_data1_sel( sr1_data, PC_out, A_sel, alu_input1);

MUX_2X1 alu_data2_sel( sr2_data, imm_gen_out, B_sel, alu_input2);

ALU alu1( alu_input1, alu_input2, alu_selection, ALU_result);

Branch_comp BC1( sr1_data, sr2_data, BrUn, BrLT, BrEq);

Data_memory DM1( clk, mem_write_en, load_type, store_type, ALU_result, sr2_data, data_mem_out);

MUX_3X1 write_back_mux( data_mem_out, ALU_result, PC_added_4, WB_sel, write_back);

// For Fibonacci sequence

always@(*)
begin
	Test_variable = Reg_4[15:0];
end

endmodule
