all: test1.txt test1.s test1.o test1.dmp test1_1.elf test1_1.dmp test1_2.elf testshex.txt test1_2.dmp

#After preprocessor
test1.txt: test1.c
	riscv64-unknown-elf-gcc -E -march=rv32imav -mabi=ilp32 test1.c>test1.txt

#After compiler
test1.s: test1.c
	riscv64-unknown-elf-gcc -S -march=rv32imav -mabi=ilp32 test1.c>test1.s

test1.o: test1.c
	riscv64-unknown-elf-gcc -c -march=rv32imav -mabi=ilp32 test1.c >test1.o

#After assembler
test1.dmp: test1.o
	riscv64-unknown-elf-objdump -d test1.o> test1.dmp

test1_1.elf: test1.c code_to_test.s
	riscv64-unknown-elf-gcc -O0 -Wall -nostdlib -march=rv32imav -mabi=ilp32 test1.c code_to_test.s -o test1_1.elf

#After linker
test1_1.dmp: test1_1.elf
	riscv64-unknown-elf-objdump -d test1_1.elf>test1_1.dmp

test1_2.elf: bootstrap.s test1.c code_to_test.s
	riscv64-unknown-elf-gcc -O3 -Wall -nostdlib -march=rv32imav -mabi=ilp32 -T lscript bootstrap.s test1.c  code_to_test.s -o test1_2.elf

#Create testshex file
testshex.txt: test1_2.elf
	riscv64-unknown-elf-elf2hex --bit-width 32 --input test1_2.elf --output testshex.txt

test1_2.dmp: test1_2.elf
	riscv64-unknown-elf-objdump -d test1_2.elf>test1_2.dmp

clean:
	rm -f test1.txt test1.s test1.o test1.dmp test1_1.elf test1_1.dmp test1_2.elf testshex.txt test1_2.dmp
