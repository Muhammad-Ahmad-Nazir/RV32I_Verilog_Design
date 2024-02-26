`timescale 1ns / 1ns

module CU(Instruction_code, source_register1, source_register2, Imm_gen_input, write_register, ALU_sel, Reg_write_en, Mem_write_en, I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en, A_Sel, B_Sel, BrLT, BrEq, BrUn, PC_Sel,  Load_type, Store_type, WB_Sel);

input [31:0] Instruction_code;
input BrLT, BrEq;
output reg Reg_write_en, I_type_en, B_Sel, L_type_en, S_type_en, Mem_write_en, B_type_en, A_Sel, BrUn, PC_Sel, J_type_en, U_type_en;
output reg [3:0] ALU_sel;
output reg [4:0] source_register1, source_register2, write_register;
output reg [19:0] Imm_gen_input;
output reg [2:0] Load_type;
output reg [1:0] Store_type, WB_Sel;


always@(*)

begin //Opcode open

	case(Instruction_code[6:0]) //Opcode checking
	
	7'b0110011:     //R-type
	begin //R-type open
		//
		I_type_en = 0;
		L_type_en = 0;
		S_type_en = 0;
		B_type_en = 0;
		J_type_en = 0;
		U_type_en = 0;
		Reg_write_en = 1;
		Mem_write_en = 0;
		A_Sel = 0;
		B_Sel = 0;
		WB_Sel = 2'd1;
		PC_Sel = 0;
		//
		source_register1 = Instruction_code[19:15];
		source_register2 = Instruction_code[24:20];
		write_register = Instruction_code[11:7];
		//
		
		if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b000)
		begin
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[31:25]==7'b0100000 && Instruction_code[14:12]==3'b000)
		begin
			ALU_sel = 4'd1;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b001)
		begin
			ALU_sel = 4'd2;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b010)
		begin
			ALU_sel = 4'd3;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b011)
		begin
			ALU_sel = 4'd4;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b100)
		begin
			ALU_sel = 4'd5;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b101)
		begin
			ALU_sel = 4'd6;
		end
		
		else if (Instruction_code[31:25]==7'b0100000 && Instruction_code[14:12]==3'b101)
		begin
			ALU_sel = 4'd7;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b110)
		begin
			ALU_sel = 4'd8;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b111)
		begin
			ALU_sel = 4'd9;
		end
	end //Closing R-type
	
	7'b0010011:  //I-type
	begin        //I-type open
		//
		I_type_en = 1;
		L_type_en = 0;
		S_type_en = 0;
		B_type_en = 0;
		J_type_en = 0;
		U_type_en = 0;
		Reg_write_en = 1;
		Mem_write_en = 0;
		A_Sel = 0;
		B_Sel = 1;
		WB_Sel = 2'd1;
		PC_Sel = 0;
		//
		source_register1 = Instruction_code[19:15];
		write_register = Instruction_code[11:7];
		Imm_gen_input = { 8'd0, {Instruction_code[31:20]}};
		//
		
		if (Instruction_code[14:12]==3'b000)
		begin
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[14:12]==3'b001)
		begin
			ALU_sel = 4'd2;
		end
		
		else if (Instruction_code[14:12]==3'b010)
		begin
			ALU_sel = 4'd3;
		end
		
		else if (Instruction_code[14:12]==3'b011)
		begin
			ALU_sel = 4'd4;
		end
		
		else if (Instruction_code[14:12]==3'b100)
		begin
			ALU_sel = 4'd5;
		end
		
		else if (Instruction_code[31:25]==7'b0000000 && Instruction_code[14:12]==3'b101)
		begin
			ALU_sel = 4'd6;
		end
		
		else if (Instruction_code[31:25]==7'b0100000 && Instruction_code[14:12]==3'b101)
		begin
			ALU_sel = 4'd7;
		end
		
		else if (Instruction_code[14:12]==3'b110)
		begin
			ALU_sel = 4'd8;
		end
		
		else if (Instruction_code[14:12]==3'b111)
		begin
			ALU_sel = 4'd9;
		end
	end    //Closing I-type
	
	7'b0000011:
	begin       //Load type
		//
		I_type_en = 0;
		L_type_en = 1;
		S_type_en = 0;
		B_type_en = 0;
		J_type_en = 0;
		U_type_en = 0;
		Reg_write_en = 1;
		Mem_write_en = 0;
		A_Sel = 0;
		B_Sel = 1;
		WB_Sel = 2'd0;
		PC_Sel = 0;
		//
		source_register1 = Instruction_code[19:15];
		write_register = Instruction_code[11:7];
		Imm_gen_input = { 8'd0, {Instruction_code[31:20]}};
		//
		
		if (Instruction_code[14:12]==3'b000)
		begin
			Load_type = 3'd0;
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[14:12]==3'b001)
		begin
			Load_type = 3'd1;
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[14:12]==3'b010)
		begin
			Load_type = 3'd2;
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[14:12]==3'b100)
		begin
			Load_type = 3'd3;
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[14:12]==3'b101)
		begin
			Load_type = 3'd4;
			ALU_sel = 4'd0;
		end
	end     // Closing Load
	
	7'b0100011: //Store type
	begin       //Open store type
		//
		I_type_en = 0;
		L_type_en = 0;
		S_type_en = 1;
		B_type_en = 0;
		J_type_en = 0;
		U_type_en = 0;
		Reg_write_en = 0;
		Mem_write_en = 1;
		A_Sel = 0;
		B_Sel = 1;
		WB_Sel = 2'd0;
		PC_Sel = 0;
		//
		source_register1 = Instruction_code[19:15];
		source_register2 = Instruction_code[24:20];
		Imm_gen_input = { 8'd0, {Instruction_code[31:25]}, {Instruction_code[11:7]}};
		//
		
		if (Instruction_code[14:12]==3'b000)
		begin
			Store_type = 3'd0;
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[14:12]==3'b001)
		begin
			Store_type = 3'd1;
			ALU_sel = 4'd0;
		end
		
		else if (Instruction_code[14:12]==3'b010)
		begin
			Store_type = 3'd2;
			ALU_sel = 4'd0;
		end
	end   // Closing Store type
	
	7'b1100011:  //Branch type
	begin        // Branch type open
		//
		I_type_en = 0;
		L_type_en = 0;
		S_type_en = 0;
		B_type_en = 1;
		J_type_en = 0;
		U_type_en = 0;
		Reg_write_en = 0;
		Mem_write_en = 0;
		A_Sel = 1;
		B_Sel = 1;
		WB_Sel = 2'd0;
		//
		ALU_sel = 4'd0;   // For the cases of PC + imm
		//
		source_register1 = Instruction_code[19:15];
		source_register2 = Instruction_code[24:20];
		Imm_gen_input = { 8'd0, {Instruction_code[31]}, {Instruction_code[7]}, {Instruction_code[30:25]}, {Instruction_code[11:8]}};
		//
		
		if (Instruction_code[14:12]==3'b000)
		begin
			BrUn = 0;
			
			if (BrEq == 1)
			begin
				PC_Sel = 1;
			end
			else
			begin
				PC_Sel = 0;
			end
			
		end
		
		if (Instruction_code[14:12]==3'b001)
		begin
			BrUn = 0;
			
			if (BrEq == 1)
			begin
				PC_Sel = 0;
			end
			else
			begin
				PC_Sel = 1;
			end
			
		end
		
		if (Instruction_code[14:12]==3'b100)
		begin
			BrUn = 0;
			
			if (BrLT == 1)
			begin
				PC_Sel = 1;
			end
			else
			begin
				PC_Sel = 0;
			end
			
		end
		
		if (Instruction_code[14:12]==3'b101)
		begin
			BrUn = 0;
			
			if (BrLT == 0)
			begin
				PC_Sel = 1;
			end
			else
			begin
				PC_Sel = 0;
			end
			
		end
		
		if (Instruction_code[14:12]==3'b110)
		begin
			BrUn = 1;
			
			if (BrLT == 1)
			begin
				PC_Sel = 1;
			end
			else
			begin
				PC_Sel = 0;
			end
			
		end
		
		if (Instruction_code[14:12]==3'b111)
		begin
			BrUn = 1;
			
			if (BrLT == 0)
			begin
				PC_Sel = 1;
			end
			else
			begin
				PC_Sel = 0;
			end
			
		end
	
	end          //Closing Branch type
	
	7'b1100111:  //Starting jalr
	begin
		if (Instruction_code[14:12]==3'b000)
		begin
			//
			I_type_en = 1;
			L_type_en = 0;
			S_type_en = 0;
			B_type_en = 0;
			J_type_en = 0;
			U_type_en = 0;
			Reg_write_en = 1;
			Mem_write_en = 0;
			A_Sel = 0;
			B_Sel = 1;
			WB_Sel = 2'd2;
			PC_Sel = 1;
			//
			ALU_sel = 4'd0;   // For the cases of PC + imm
			//
			source_register1 = Instruction_code[19:15];
			write_register = Instruction_code[11:7];
			Imm_gen_input = { 8'd0, {Instruction_code[31:20]}};
			//
		end
	end         //Closing jalr
	
	7'b1101111:  //Starting jal
	begin
		//
		I_type_en = 0;
		L_type_en = 0;
		S_type_en = 0;
		B_type_en = 0;
		J_type_en = 1;
		U_type_en = 0;
		Reg_write_en = 1;
		Mem_write_en = 0;
		A_Sel = 1;
		B_Sel = 1;
		WB_Sel = 2'd2;
		PC_Sel = 1;
		//
		ALU_sel = 4'd0;   // For the cases of PC + imm
		//
		write_register = Instruction_code[11:7];
		Imm_gen_input = { {Instruction_code[31]}, {Instruction_code[19:12]}, {Instruction_code[20]}, {Instruction_code[30:21]} };
		//
	end         //Closing jal
	
	7'b0110111:  //Starting lui
	begin
		//
		I_type_en = 0;
		L_type_en = 0;
		S_type_en = 0;
		B_type_en = 0;
		J_type_en = 0;
		U_type_en = 1;
		Reg_write_en = 1;
		Mem_write_en = 0;
		A_Sel = 0;
		B_Sel = 1;
		WB_Sel = 2'd1;
		PC_Sel = 0;
		//
		ALU_sel = 4'd0;   // For the cases of PC + imm
		//
		write_register = Instruction_code[11:7];
		Imm_gen_input = { {Instruction_code[31:12]} };
		//
	end         //Closing lui
	
	7'b0110111:  //Starting auipc
	begin
		//
		I_type_en = 0;
		L_type_en = 0;
		S_type_en = 0;
		B_type_en = 0;
		J_type_en = 0;
		U_type_en = 1;
		Reg_write_en = 1;
		Mem_write_en = 0;
		A_Sel = 1;
		B_Sel = 1;
		WB_Sel = 2'd1;
		PC_Sel = 0;
		//
		ALU_sel = 4'd0;   // For the cases of PC + imm
		//
		write_register = Instruction_code[11:7];
		Imm_gen_input = { {Instruction_code[31:12]} };
		//
	end         //Closing auipc
	
	endcase  //Opcode checking closed

end // Opcode closing

endmodule