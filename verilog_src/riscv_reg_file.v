module riscv_reg_file (i_RR1, i_RR2, i_WRR,i_WREnable, i_WRDATA, o_DATA1, o_DATA2);
  parameter BUS_WIDTH = 32;
  parameter REG_ADDR_WIDTH = 5;
  parameter REG_DEPTH = 1<< REG_ADDR_WIDTH;

  integer index=0;

  input i_WREnable;
  input [REG_ADDR_WIDTH-1:0] i_RR1;
  input [REG_ADDR_WIDTH-1:0] i_RR2;
  input [REG_ADDR_WIDTH-1:0] i_WRR;
  input [BUS_WIDTH-1:0] i_WRDATA;

  output [BUS_WIDTH-1:0] o_DATA1;
  output [BUS_WIDTH-1:0] o_DATA2;

  reg [BUS_WIDTH-1:0] l_reg_file[0:REG_DEPTH-1];
  reg [BUS_WIDTH-1:0] o_DATA1;
  reg [BUS_WIDTH-1:0] o_DATA2;

  
  always @*
  begin
    if(i_WREnable == 1'b1)
      begin
        l_reg_file[i_WRR] = i_WRDATA;
      end

		o_DATA1 = l_reg_file[i_RR1];
		o_DATA2 = l_reg_file[i_RR2];
  end 

endmodule;
