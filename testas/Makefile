PHONY: test build list clean

test:
	# avr-as -mmcu=atmega328 -o main.o main.asm
	# avr-ld -o main.elf main.o
	# avr-gcc -Wl, -Map main.map main.o
	# avr-ld -Map main.map main.o

build:
	avr-gcc -x assembler-with-cpp -mmcu=atmega328  main.S -o main.o
	avr-objcopy -O ihex main.o main.hex

list: build
	avr-objdump -S main.o
	avr-objdump -m avr -D main.hex

debug: build
	/opt/simulavr/src/simulavr -g -d atmega328 -F 8000000 &
	avr-gdb main.o

clean:
	# rm *.hex
	# rm *.elf
	rm *.map
	rm *.out
	rm *.o