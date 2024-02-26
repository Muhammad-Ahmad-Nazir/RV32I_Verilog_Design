`timescale 1ns / 1ns

module Branch_comp( source_register1, source_register2, BrUn, BrLT, BrEq);

input [31:0] source_register1;
input [31:0] source_register2;
input BrUn;
output reg BrLT;
output reg BrEq;


always@(*)
begin
	if (BrUn == 1)
	begin
		if ( source_register1 < source_register2)
		begin
			BrLT = 1;
			BrEq = 0;
		end
		
		else if ( source_register1 == source_register2)
		begin
			BrLT = 0;
			BrEq = 1;
		end
		
		else
		begin
			BrLT = 0;
			BrEq = 0;
		end
	end
	
	else
	begin
		if ( $signed(source_register1) < $signed(source_register2) )
		begin
			BrLT = 1;
			BrEq = 0;
		end
		
		else if ( source_register1 == source_register2)
		begin
			BrLT = 0;
			BrEq = 1;
		end
		
		else
		begin
			BrLT = 0;
			BrEq = 0;
		end
	end
end

endmodule