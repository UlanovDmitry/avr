#define __SFR_OFFSET 0x00
#include <avr/io.h>


.data
.section .text
.org 0x0000
.globl main

main:
 		cbi   DDRB,2
		sbi	  PORTB,2
		sbi   DDRC,0
start:	sbic  PINB,2
		rjmp  off
		sbi   PORTC,0
		rjmp  start
off:	cbi   PORTC,0
		rjmp  start
