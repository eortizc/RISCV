module riscv_mux(i_DATA1, i_DATA2, i_SELECT, o_DATAOut);
	parameter BUS_WIDTH = 32;
	
	input i_SELECT;
	input [BUS_WIDTH-1:0] i_DATA1;
	input [BUS_WIDTH-1:0] i_DATA2;

	output [BUS_WIDTH-1:0] o_DATAOut;

	always @*
		begin
			case(i_SELECT)
				1'b0: o_DATAOut = i_DATA1;
				1'b1: o_DATAOut = i_DATA2;
			endcase
		end

endmodule

