module riscv_cpu(i_CLK, i_DATA, o_ADDR);
  parameter BUS_WIDTH = 32;
  input i_CLK;
  input [BUS_WIDTH -1 :0] i_DATA;
  output [BUS_WIDTH-1:0] o_ADDR;
  reg [BUS_WIDTH -1 :0] o_ADDR;
  reg [BUS_WIDTH-1:0] l_DATA;
  wire [BUS_WIDTH-1:0] l_reg_data1;
  wire [BUS_WIDTH-1:0] l_reg_data2;
  riscv_reg_file reg_file(i_CLK,1'b0,i_DATA[19:15], i_DATA[24:20],5'b0, 1'b0,32'b0,l_reg_data1,l_reg_data2);

  always @(posedge i_CLK)
  begin
    o_ADDR<=o_ADDR+4;
    l_DATA<=i_DATA+l_DATA;
  end

endmodule
