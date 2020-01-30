PHONY: all list

all:
	avr-gcc -mmcu=attiny45 -Wall -Os -o build/blink.elf blink.c
	avr-objcopy -O ihex build/blink.elf build/blink.hex

list:
	# avr-objdump -m avr -D ./blink.hex
	avr-objdump -S build/blink.elf

clean:
	rm build/*