#include "Vriscv_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char** argv, char** env)
{
  int main_time =0;
	Verilated::commandArgs(argc, argv);
  //Init top instance
	Vriscv_top* top = new Vriscv_top;
  //Init trace dump
  Verilated::traceEverOn(true);
  VerilatedVcdC* vcddump = new VerilatedVcdC;
  top->trace(vcddump, 99);
  vcddump->open("simx.vcd");
	//while(!Verilated::gotFinish()) {top->eval();}
  while(1)
  {
    main_time +=1;
    vcddump->dump(main_time);
    vcddump->flush();
    top->eval();
    top->i_CLK = !top->i_CLK;
  }
	delete top;
	exit(0);
}
