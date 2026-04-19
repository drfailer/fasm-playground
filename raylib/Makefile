RAYLIB_LIB_PATH=$(HOME)/Programming/usr/lib
LD_FLAGS=-L$(RAYLIB_LIB_PATH) \
		 -l:libraylib.a \
		 -lc -lm \
		 -dynamic-linker /lib64/ld-linux-x86-64.so.2

prog: main.asm
	@mkdir -p build
	fasm main.asm build/main.o
	ld -o prog build/main.o $(LD_FLAGS)
