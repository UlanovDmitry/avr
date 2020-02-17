PHONY: all asm list clean 

all:
	avr-gcc -mmcu=atmega328p -Wall -Os -o build/blink.elf blink.c
	avr-objcopy -O ihex build/blink.elf build/blink.hex

asm:
	avr-gcc -x assembler-with-cpp -mmcu=atmega328p blink.S -o build/blink.o 	
	avr-objcopy -O ihex build/blink.o build/blink.hex 

list:
	# avr-objdump -m avr -D ./blink.hex
	# avr-objdump -S build/blink.elf
	avr-objdump -S build/blink.o


clean:
	rm build/*