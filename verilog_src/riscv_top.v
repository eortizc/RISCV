module riscv_top (input CLK, inout ADDR, RW);
wire RW;

  initial
    begin
      $display("Hello World\n");
      $finish;
    end

  riscv_cpu CORE0(CLK, ADDR, RW);
endmodule
