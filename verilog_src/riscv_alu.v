module riscv_alu(i_CLK, i_RST, i_OP1, i_OP2,i_Control, o_Result);
  parameter BUS_WIDTH = 32;
  parameter CTRL_WIDTH = 4;

  input  i_CLK, i_RST;
  input  [CTRL_WIDTH-1:0] i_Control;
  input  [BUS_WIDTH-1:0] i_OP1;
  input  [BUS_WIDTH-1:0] i_OP2;
  output [BUS_WIDTH-1:0] o_Result;
  reg    [BUS_WIDTH-1:0] o_Result;


  always @(posedge i_CLK)
  begin
    if(i_RST == 1'b1)
    begin
      o_Result <= 0;
    end
    else
    begin
      case(i_Control)
        0: o_Result <= (i_OP1 + i_OP2);
        1: o_Result <= (i_OP1 - i_OP2);
        default: o_Result <= 0;
      endcase
    end
  
  end


endmodule
