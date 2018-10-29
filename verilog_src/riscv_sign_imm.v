module riscv_sign_imm(i_DATA,o_IMM);
	parameter BUS_WIDTH = 32;

	input  [BUS_WIDTH-1:0] i_DATA;
	output [BUS_WIDTH-1:0] o_IMM;

	always @*
	begin
		o_IMM = i_DATA;	
	end

endmodule
