PHONY: compile list hex clean

compile:
	avr-gcc -mmcu=atmega328p -Wall -Os -o blink.elf blink.c

hex: compile
	avr-objcopy -j .text -j .data -O ihex blink.elf blink.hex

list: hex
	avr-objdump -m avr -D blink.hex
	avr-objdump -S blink.elf

clean:
	rm *.hex
	rm *.elf