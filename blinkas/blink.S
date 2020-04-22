#define F_CPU 16000000UL
#define __SFR_OFFSET 0
#include <avr/io.h>
; .equ PB0, 0x00
; .equ ddrb, 0x04
; .equ portb, 0x05

.section .text
.global main
main:
        rcall   init
loop:   ; главный цикл (вариант на 2МГц)
        jmp loop
        ; sbi     PORTB,0	
        ; nop
        ; nop
        ; cbi     PORTB,0
        ; rjmp	loop

init:
        ;Конфигурация оборудования
        ;устанавливаем предделитель 1024 (101) 
        ;и сброс таймера по совпадению (режим CTC)
        lds	r16,TCCR1B		
        ori	r16, (0<<CS12)|(1<<CS10)|(1<<WGM12) 
        sts	TCCR1B,r16	
        ;включаем прерывание по совпадению в канале A
        lds	r16,TIMSK1		
        ori	r16,1<<OCIE1A
        sts	TIMSK1,r16		
        ;устанавливаем значение для сравнения 
        ldi     r16,0x10        
        ldi     r17,0x00
        sts     OCR1AH,r17 
        sts     OCR1AL,r16 
        ;настраиваем порт на выход
        ldi     r16,0x01        
        out     DDRB,r16
        ;Программные настройки			
        ldi	r17,0x01		;значение для инверсии
        sei				;разрешаем прерывания глобально
        ;cli
        ret

.global TIMER1_COMPA_vect
TIMER1_COMPA_vect: 
        cli
        in      r16, PINB
        eor     r16, r17
        out     PORTB, r16
        sei
        reti

.global __vector_default        ; Note [10]
__vector_default:
    reti
.end