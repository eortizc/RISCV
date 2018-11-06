module riscv_control(i_INST, o_ALUop, o_SignExt, o_ImmFormat, o_ALUSrc, o_RegWrEnable);
	parameter BUS_WIDTH = 32;

	input [BUS_WIDTH-1:0] i_INST;

	output [3:0] o_ALUop;
	output       o_SignExt;
  output [2:0] o_ImmFormat;
  output       o_ALUSrc;
	output  		 o_RegWrEnable;

	always @*
    begin
			case(i_INST[6:0])
				7'b0110011:
					begin
						o_ALUop = {i_INST[30],i_INST[14:12]};
						o_ALUSrc = 1'b0;
						o_ImmFormat = 3'b0;
						o_RegWrEnable = 1'b1;
					end
				7'b0010011:
					begin
						o_ALUop = {i_INST[30],i_INST[14:12]};
						o_ALUSrc = 1'b1;
						o_ImmFormat = 3'b001;
						o_RegWrEnable = 1'b1;
					end
				default:
					begin
						o_ALUSrc = 1'b1;
						o_ImmFormat = 3'b000;
         		o_ALUop = 4'b0;
						o_RegWrEnable = 1'b0;
					end
			endcase
		end
endmodule
