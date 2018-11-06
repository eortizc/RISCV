#include "Vriscv_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char** argv, char** env)
{
  int main_time =0;
	int memory[256];
	Verilated::commandArgs(argc, argv);
  //Init top instance
	Vriscv_top* top = new Vriscv_top;
  //Init trace dump
  Verilated::traceEverOn(true);
  VerilatedVcdC* vcddump = new VerilatedVcdC;
  top->trace(vcddump, 99);
  vcddump->open("simx.vcd");
	//while(!Verilated::gotFinish()) {top->eval();}
	memory[0] = 0b00000000010100000000000010010011;
  memory[4] = 0b00000000000100000000000100110011;
  while(1)
  {
    main_time +=1;
    vcddump->dump(main_time);
    vcddump->flush();
    top->eval();
    top->i_CLK = !top->i_CLK;

		if(top->i_CLK)
		{
			top->i_DATA = memory[top->o_ADDR]; 
		}

  }
	delete top;
	exit(0);
}
