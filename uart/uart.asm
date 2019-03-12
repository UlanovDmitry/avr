		.include "m328Pdef.inc"   	; Используем ATMega328P
;RAM 
		.DSEG
;FLASH 
        .CSEG				

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
		rjmp Timer1CA
		.org $018 ;TIMER1_COMPB Timer/Coutner1 Compare Match B
		reti
		.org $01A ;TIMER1_OVF Timer/Counter1 Overflow
		reti
		.org $01C ;TIMER0_COMPA Timer/Counter0 Compare Match A
		reti
		.org $01E ;TIMER0_COMPB Timer/Coutner0 Compare Match B
		reti
		.org $020 ;TIMER0_OVF Timer/Counter0 Overflow
		reti
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
UDRE_I:
            

Timer1CA:   
			cli							; запрещаем другие прерывания
            in      r16,pinb            ; читаем содержимое порта
			eor		r16,r17				; инвертируем нулевой бит 
			out		portb,r16			; пишем данные обратно в порт
			sei							; заново разрешаем прерывания
			reti	

;Точка входа 
Reset:   	
            ldi 	r16,Low(RAMEND)	;Инициализация стека
		    out 	spl,r16			
		 	ldi 	r16,High(RAMEND)
		 	out 	sph,r16
                                    ;Конфигурация оборудования
            eor     r1,r1           			;baudrate - 16MHz/9600bps (103)
            sts     ubrr0h,r1
            ldi     r24,0x67 
            sts     ubrr0l,r24
            ldi     r24,(1<<rxen0)|(1<<txen0)|(1<<rxcie0)|(1<<udrie0)   ;прием, передача и их прерывания	
            sts     ucsr0b,r24
            ldi     r24,(3<<ucsz00)				;8bit 1stop
            sts     ucsr0c,r24
            sei

;Цикл выполнения
Main:		
            call    UReceive
            inc     r25
            call    UTransmit
            rjmp    Main

;Процедуры
UReceive:
            lds     r24,ucsr0a
            sbrs    r24,rxc0 
            rjmp    UReceive
            lds     r25,udr0
            ret

UTransmit:
            lds     r24,ucsr0a
            sbrs    r24,udre0
            rjmp    UTransmit
            sts     udr0,r25
            ret

;EEPROM
	    .ESEG
