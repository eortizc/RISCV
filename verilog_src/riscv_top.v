module riscv_top ( i_CLK, i_DATA, o_ADDR);
  parameter BUS_WIDTH = 32;
  
  input i_CLK;
  input [BUS_WIDTH -1 : 0] i_DATA;
  output [BUS_WIDTH -1 :0] o_ADDR;

  initial
    begin
      $finish;
    end

  riscv_cpu CORE0(i_CLK, i_DATA, o_ADDR);

endmodule
