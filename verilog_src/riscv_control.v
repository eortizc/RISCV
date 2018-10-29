module riscv_control(i_INST, o_ALUop, o_SignExt);
	parameter BUS_WIDTH = 32;

	input [BUS_WIDTH-1:0] i_INST;

	output [3:0] o_ALUop;
	output o_SignExt;

	always @*
    begin
			case(i_INST[6:0])
				7'b0110011:
					begin
						o_ALUop = {i_INST[30],i_INST[14:12]};
					end
				default:
					begin
						o_ALUop = 4'b0;
					end
			endcase
		end
endmodule
