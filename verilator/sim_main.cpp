#include "Vriscv_top.h"
#include "verilated.h"

int main(int argc, char** argv, char** env)
{
	Verilated::commandArgs(argc, argv);
	Vriscv_top* top = new Vriscv_top;
	while(!Verilated::gotFinish()) {top->eval();}
	delete top;
	exit(0);
}
