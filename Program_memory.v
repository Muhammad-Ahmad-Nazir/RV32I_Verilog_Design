`timescale 1ns / 1ns

// RV32I can be either little or big endian
// Here, we are using little endian format

module Program_memory( Counter_value, Instruction_code);

input [31:0] Counter_value;
output reg [31:0] Instruction_code;
reg [7:0] Registers[1000:0];

initial 
begin
	Registers[0] = 8'h93;
	Registers[1] = 8'h02;
	Registers[2] = 8'h40;
	Registers[3] = 8'h06;
	
	Registers[4] = 8'h13;
	Registers[5] = 8'h81;
	Registers[6] = 8'h00;
	Registers[7] = 8'h00;

	Registers[8] = 8'h93;
	Registers[9] = 8'h01;
	Registers[10] = 8'h11;
	Registers[11] = 8'h00;
	
	Registers[12] = 8'h13;
	Registers[13] = 8'h02;
	Registers[14] = 8'h01;
	Registers[15] = 8'h00;
	
	Registers[16] = 8'hB3;
	Registers[17] = 8'h81;
	Registers[18] = 8'h21;
	Registers[19] = 8'h00;
	
	Registers[20] = 8'hE3;
	Registers[21] = 8'h58;
	Registers[22] = 8'h52;
	Registers[23] = 8'hFE;
	
	Registers[24] = 8'h33;
	Registers[25] = 8'h01;
	Registers[26] = 8'h31;
	Registers[27] = 8'h00;
	
	Registers[28] = 8'hB3;
	Registers[29] = 8'h01;
	Registers[30] = 8'h31;
	Registers[31] = 8'h40;
	
	Registers[32] = 8'h33;
	Registers[33] = 8'h01;
	Registers[34] = 8'h31;
	Registers[35] = 8'h40;
	
	Registers[36] = 8'h67;
	Registers[37] = 8'h03;
	Registers[38] = 8'hC0;
	Registers[39] = 8'h00;
	
	Registers[40] = 8'h00;
	Registers[41] = 8'h00;
	Registers[42] = 8'h00;
	Registers[43] = 8'h00;
	
	Registers[44] = 8'h00;
	Registers[45] = 8'h00;
	Registers[46] = 8'h00;
	Registers[47] = 8'h00;
	
	Registers[48] = 8'h00;
	Registers[49] = 8'h00;
	Registers[50] = 8'h00;
	Registers[51] = 8'h00;
	
	Registers[52] = 8'h00;
	Registers[53] = 8'h00;
	Registers[54] = 8'h00;
	Registers[55] = 8'h00;
	
	Registers[56] = 8'h00;
	Registers[57] = 8'h00;
	Registers[58] = 8'h00;
	Registers[59] = 8'h00;
	
	Registers[60] = 8'h00;
	Registers[61] = 8'h00;
	Registers[62] = 8'h00;
	Registers[63] = 8'h00;
	
	Registers[64] = 8'h00;
	Registers[65] = 8'h00;
	Registers[66] = 8'h00;
	Registers[67] = 8'h00;
	
	Registers[68] = 8'h00;
	Registers[69] = 8'h00;
	Registers[70] = 8'h00;
	Registers[71] = 8'h00;
	
	Registers[72] = 8'h00;
	Registers[73] = 8'h00;
	Registers[74] = 8'h00;
	Registers[75] = 8'h00;
	
	Registers[76] = 8'h00;
	Registers[77] = 8'h00;
	Registers[78] = 8'h00;
	Registers[79] = 8'h00;
	
	Registers[80] = 8'h00;
	Registers[81] = 8'h00;
	Registers[82] = 8'h00;
	Registers[83] = 8'h00;
	
	Registers[84] = 8'h00;
	Registers[85] = 8'h00;
	Registers[86] = 8'h00;
	Registers[87] = 8'h00;
	
	Registers[88] = 8'h00;
	Registers[89] = 8'h00;
	Registers[90] = 8'h00;
	Registers[91] = 8'h00;
	
	Registers[92] = 8'h00;
	Registers[93] = 8'h00;
	Registers[94] = 8'h00;
	Registers[95] = 8'h00;
	
	Registers[96] = 8'h00;
	Registers[97] = 8'h00;
	Registers[98] = 8'h00;
	Registers[99] = 8'h00;
end

always @(Counter_value) begin
	Instruction_code = {Registers[Counter_value + 3], Registers[Counter_value + 2], Registers[Counter_value + 1], Registers[Counter_value]};
end

endmodule
	