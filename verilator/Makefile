TARGET = riscv_top

all:
	verilator -I../verilog_src/ --trace -cc ../verilog_src/$(TARGET).v --exe sim_main.cpp ; \
	cd obj_dir; \
	$(MAKE) -j -f V$(TARGET).mk
	
clean:
	rm -rf obj_dir

sim:
	cd obj_dir;\
	./V$(TARGET)

wave:
	cd obj_dir;\
	gtkwave simx.vcd &
