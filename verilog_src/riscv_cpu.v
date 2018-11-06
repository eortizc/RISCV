module riscv_cpu(i_CLK, i_DATA, o_ADDR);
  parameter BUS_WIDTH = 32;
  input i_CLK;
  input [BUS_WIDTH -1 :0] i_DATA;
  output [BUS_WIDTH-1:0] o_ADDR;
  reg [BUS_WIDTH -1 :0] o_ADDR;
  reg [BUS_WIDTH-1:0] l_DATA;
  wire [BUS_WIDTH-1:0] l_reg_data1;
  wire [BUS_WIDTH-1:0] l_reg_data2;
	wire l_RegWrEnable, l_ALUSrc, l_SignExt;
	wire [BUS_WIDTH-1:0] l_ALU_DATA;
	wire [BUS_WIDTH-1:0] l_sign_imm;
	wire [3:0] l_ALUOp;
	wire [2:0] l_ImmFormat;
  riscv_reg_file reg_file(i_DATA[19:15], i_DATA[24:20],i_DATA[11:7], l_RegWrEnable,l_DATA,l_reg_data1,l_reg_data2);
  riscv_mux alu_mux(l_reg_data2, l_sign_imm, l_ALUSrc, l_ALU_DATA);
  riscv_alu alu(l_reg_data1, l_ALU_DATA,l_ALUOp,);  
	riscv_control mainCtrl(i_DATA, l_ALUOp, l_SignExt, l_ImmFormat,l_ALUSrc, l_RegWrEnable);
  always @(posedge i_CLK)
  begin
    o_ADDR<=o_ADDR+4;
  end

endmodule
