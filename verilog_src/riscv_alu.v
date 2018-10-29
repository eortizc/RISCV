module riscv_alu(i_OP1, i_OP2,i_Control, o_Result);
  parameter BUS_WIDTH = 32;
  parameter CTRL_WIDTH = 4;

  input  [CTRL_WIDTH-1:0] i_Control;
  input  [BUS_WIDTH-1:0] i_OP1;
  input  [BUS_WIDTH-1:0] i_OP2;
  output [BUS_WIDTH-1:0] o_Result;
  reg    [BUS_WIDTH-1:0] o_Result;


  always @*
  begin
    case(i_Control)
      4'b0000: o_Result = (i_OP1 + i_OP2);
      4'b1000: o_Result = (i_OP1 - i_OP2);
			4'b0001: o_Result = (i_OP1 << i_OP2);
			4'b0010: o_Result = ($signed(i_OP1) < $signed(i_OP2)) ? 0:1;
			4'b0011: o_Result = (i_OP1 < i_OP2) ? 0:1;
			4'b0100: o_Result = (i_OP1 ^ i_OP2);
			4'b0101: o_Result = (i_OP1 >> i_OP2);
			4'b1101: o_Result = (i_OP1 >>> i_OP2);
			4'b0110: o_Result = (i_OP1 | i_OP2);
			4'b0111: o_Result = (i_OP1 & i_OP2);
      default: o_Result = 0;
    endcase
  end

endmodule
