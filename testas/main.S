#define F_CPU 16000000UL
#define __SFR_OFFSET 0
#include <avr/io.h>

.equ pb0, 0x00
.equ ddrb, 0x04
.equ portb, 0x05

.macro xin p1,p2
.if \p2<64 
in \p1,\p2 
.else
lds \p1,\p2 
.endif
.endm

.macro xout p1,p2
.if \p1<64 
out \p1,\p2 
.else
sts \p1,\p2 
.endif
.endm

.section .text
.global main
main:   rcall init
loop:   jmp loop
init:   ret

digits: .word 0x00fc,0x0018,0x016c,0x013c,0x0198
        .word 0x01b4,0x01f4,0x001c,0x01fc,0x01bc,0x0000  

.global __vector_default   
__vector_default:
    reti
.end