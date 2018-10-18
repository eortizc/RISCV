module riscv_cpu(input CLK, inout ADDR, output RW);
reg RW;
assign ADDR = RW ? 1 : 1'bZ;

always @(posedge CLK)
  begin
    RW<=0;
  end

  

endmodule
