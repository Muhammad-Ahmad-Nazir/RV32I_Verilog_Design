`timescale 1ns / 1ns

module Data_memory(clk, Mem_write, Load_type, Store_type, Address, Write_data, Data_mem_out);

input clk;
input Mem_write;
input [2:0] Load_type;
input [1:0] Store_type;
input [31:0] Address;
input [31:0] Write_data;
output reg  [31:0] Data_mem_out;
reg [7:0] byte[255:0];

initial
begin
byte[0] = 32'd5;
byte[1] = 32'd0;
byte[2] = 32'd0;
byte[3] = 32'd0;

byte[4] = 32'd0;
byte[5] = 32'd0;
byte[6] = 32'd0;
byte[7] = 32'd0;
end

always@(posedge clk)
begin
	
	if (Mem_write == 0)
	begin
		if (Load_type == 3'd0)
		begin
			Data_mem_out[31:24] = {8{byte[7]}};
			Data_mem_out[23:16] = {8{byte[7]}};
			Data_mem_out[15:8] = {8{byte[7]}};
			Data_mem_out[7:0] = byte[Address];
		end
		
		else if (Load_type == 3'd1)
		begin
			Data_mem_out[31:24] = {8{byte[15]}};
			Data_mem_out[23:16] = {8{byte[15]}};
			Data_mem_out[15:8] = {8{byte[Address+1]}};
			Data_mem_out[7:0] = byte[Address];
		end
		
		else if (Load_type == 3'd2)
		begin
			Data_mem_out[31:24] = {8{byte[Address+3]}};
			Data_mem_out[23:16] = {8{byte[Address+2]}};
			Data_mem_out[15:8] = {8{byte[Address+1]}};
			Data_mem_out[7:0] = byte[Address];
		end
		
		else if (Load_type == 3'd3)
		begin
			Data_mem_out[31:24] = 8'd0;
			Data_mem_out[23:16] = 8'd0;
			Data_mem_out[15:8] = 8'd0;
			Data_mem_out[7:0] = byte[Address];
		end
		
		else if (Load_type == 3'd4)
		begin
			Data_mem_out[31:24] = {8'd0};
			Data_mem_out[23:16] = {8'd0};
			Data_mem_out[15:8] = byte[Address+1];
			Data_mem_out[7:0] = byte[Address];
		end
	end
end

always@(*)
begin
	
	if (Mem_write == 1)
	begin
		if (Store_type == 2'd0)
		begin
			byte[Address+3] = {8{Write_data[7]}};
			byte[Address+2] = {8{Write_data[7]}};
			byte[Address+1] = {8{Write_data[7]}};
			byte[Address] = Write_data[7:0];
		end
		
		else if (Store_type == 2'd1)
		begin
			byte[Address+3] = {8{Write_data[15]}};
			byte[Address+2] = {8{Write_data[15]}};
			byte[Address+1] = Write_data[15:8];
			byte[Address] = Write_data[7:0];
		end
		
		else if (Store_type == 2'd2)
		begin
			byte[Address+3] = Write_data[31:24];
			byte[Address+2] = Write_data[23:16];
			byte[Address+1] = Write_data[15:8];
			byte[Address] = Write_data[7:0];
		end
	end
end

endmodule