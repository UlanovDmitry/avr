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

// program memory to first register pair
.macro pm2r1 p1
    ldi r16, lo8(\p1)
    ldi r17, hi8(\p1)
.endm

// load from program memory by address
.macro ldpm 
    mov zl,r16
    mov zh,r17
    lpm r16,z+
    lpm r17,z
.endm


.section .text
.global main
main:   
        rcall init
loop:   
        rcall load_digit
        jmp loop
        ret

// initialisation
init:   
        ldi r16, 2
        ret

// load digit 
load_digit:
        andi r16, 0x0f  // put mask
        andi r17, 0x00
        lsl r16         // mult number on 2
        rol r17
        mov r18, r16
        mov r19, r17
        pm2r1 digits
        add r16, r18
        add r17, r19
        ldpm
        ret


digits: .word 0x00fc,0x0018,0x016c,0x013c,0x0198
        .word 0x01b4,0x01f4,0x001c,0x01fc,0x01bc,0x0000  

.global __vector_default   
__vector_default:
    reti
.end