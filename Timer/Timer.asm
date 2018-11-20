		.include "m328Pdef.inc"   	; Используем ATMega328P
		.include "macro.inc"		; Подключаем макросы
;RAM 
		.DSEG
;FLASH 
        .CSEG				

;Таблица прерываний
		.org $000 ;RESET External Pin, Power-on Reset, Brown-out Reset and Watchdog System Reset
		rjmp	Reset
		.org $002 ;INT0 External Interrupt Request 0
		reti
		.org $004 ;INT1 External Interrupt Request 0
		reti
		.org $006 ;PCINT0 Pin Change Interrupt Request 0
		reti
		.org $008 ;PCINT1 Pin Change Interrupt Request 1
		reti
		.org $00A ;PCINT2 Pin Change Interrupt Request 2
		reti
		.org $00C ;WDT Watchdog Time-out Interrupt
		reti
		.org $00E ;TIMER2_COMPA Timer/Counter2 Compare Match A
		reti
		.org $010 ;TIMER2_COMPB Timer/Coutner2 Compare Match B
		reti
		.org $012 ;TIMER2_OVF Timer/Counter2 Overflow
		reti
		.org $014 ;TIMER1_CAPT Timer/Counter1 Capture Event
		reti
		.org $016 ;TIMER1_COMPA Timer/Counter1 Compare Match A
		reti
		.org $018 ;TIMER1_COMPB Timer/Coutner1 Compare Match B
		reti
		.org $01A ;TIMER1_OVF Timer/Counter1 Overflow
		reti
		.org $01C ;TIMER0_COMPA Timer/Counter0 Compare Match A
		reti
		.org $01E ;TIMER0_COMPB Timer/Coutner0 Compare Match B
		reti
		.org $020 ;TIMER0_OVF Timer/Counter0 Overflow
		rjmp Timer0OV
		.org $022 ;SPI STC SPI Serial Transfer Complete
		reti
		.org $024 ;USART_RX USART Rx Complete
		reti
		.org $026 ;USART_UDRE USART Data Register Empty
		reti
		.org $028 ;USART_TX USART Tx Complete
		reti
		.org $02A ;ADC ADC Conversion Complete
		reti
		.org $02C ;EE READY EEPROM Ready
		reti
		.org $02E ;ANALOG COMP Analog Comparator
		reti
		.org INT_VECTORS_SIZE      	;Конец таблицы прерываний

;Обработчики прерываний 
Timer0OV:	pushf
			push    r17
			push    r18
			push    r19			

			pop     r19
			pop     r18
			pop     r17
			popf
			reti	

;Точка входа 
Reset:   	ldi 	R16,Low(RAMEND)	;Инициализация стека
		    out 	SPL,R16			
		 	ldi 	R16,High(RAMEND)
		 	out 	SPH,R16
;.include "coreinit.inc"	        ;Очистка памяти
                                    ;Конфигурация оборудования
			lds		r16,timsk0		;включаем прерывание по переполнению T0
			ori		r16,1<<toie0
			sts		timsk0,r16		
			in		r16,tccr0b		;устанавливаем предделитель 1 (001)
			ori		r16,(1<<cs00)
			out		tccr0b,r16	
			sei						;разрешаем прерывания глобально

;Цикл выполнения
Main:
			nop
			nop ax, i
			nop
			jmp	Main

;Процедуры

;EEPROM
	    .ESEG
