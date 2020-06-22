PHONY: test build list clean

test:
	# avr-as -mmcu=atmega328p -o blink.o blink.asm
	# avr-ld -o blink.elf blink.o
	# avr-gcc -Wl, -Map blink.map blink.o
	# avr-ld -Map blink.map blink.o

build:
	avr-gcc -x assembler-with-cpp -mmcu=atmega328p  blink.S -o blink.o
	avr-objcopy -O ihex blink.o blink.hex

list: build
	avr-objdump -S blink.o
	avr-objdump -m avr -D blink.hex

clean:
	# rm *.hex
	# rm *.elf
	rm *.map
	rm *.out
	rm *.o