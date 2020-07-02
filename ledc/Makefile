PHONY: compile list hex clean

compile:
	avr-gcc -mmcu=atmega328p -Wall -Os -ggdb -o main.elf main.c

hex: compile
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex

list: hex
	avr-objdump -S main.elf
	avr-objdump -m avr -D main.hex

clean:
	rm *.hex
	rm *.elf