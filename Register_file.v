`timescale 1ns / 1ns

module Register_file( source_register1, source_register2, write_register, clk, source_register1_data, source_register2_data, write_enable, data_to_write, Register_4);

input clk;
input [31:0] data_to_write;
input [4:0] source_register1, source_register2, write_register;
input write_enable;
output reg [31:0]  source_register1_data, source_register2_data, Register_4; //Register_4 is being used for storing fibonnaci output data

reg [31:0] regfile [31:0]; //32 registers, 32 bit wide

initial begin
	source_register1_data = 0;
	source_register2_data = 0;
	regfile[0] = 32'h0000_0000;
	regfile[1] = 32'h0000_0000;
	regfile[2] = 32'h0000_0000;
	regfile[3] = 32'h0000_0000;
	regfile[4] = 32'h0000_0000;
	regfile[5] = 32'h0000_0000;
	regfile[6] = 32'h0000_0000;
	regfile[7] = 32'h0000_0000;
	regfile[8] = 32'h0000_0000;
	regfile[9] = 32'h0000_0000;
	regfile[10] = 32'h0000_0000;
	regfile[11] = 32'h0000_0000;
	regfile[12] = 32'h0000_0000;
	regfile[13] = 32'h0000_0000;
	regfile[14] = 32'h0000_0000;
	regfile[15] = 32'h0000_0000;
	regfile[16] = 32'h0000_0000;
	regfile[17] = 32'h0000_0000;
	regfile[18] = 32'h0000_0000;
	regfile[19] = 32'h0000_0000;
	regfile[20] = 32'h0000_0000;
	regfile[21] = 32'h0000_0000;
	regfile[22] = 32'h0000_0000;
	regfile[23] = 32'h0000_0000;
	regfile[24] = 32'h0000_0000;
	regfile[25] = 32'h0000_0000;
	regfile[26] = 32'h0000_0000;
	regfile[27] = 32'h0000_0000;
	regfile[28] = 32'h0000_0000;
	regfile[29] = 32'h0000_0000;
	regfile[30] = 32'h0000_0000;
	regfile[31] = 32'h0000_0000;
end

always @(posedge clk)
begin
	if (write_enable)
	begin
		regfile[write_register] = data_to_write;
	end
end

always @(*)
begin
	source_register1_data = regfile[source_register1];
	source_register2_data = regfile[source_register2];
	Register_4 = regfile[4];

end

endmodule