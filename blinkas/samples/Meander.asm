		.include "m328Pdef.inc"   	; ���������� ATMega328P
		;.include "macro.inc"		; ���������� �������
;RAM 
		.DSEG
;FLASH 
        .CSEG				

;������� ����������
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
		.org INT_VECTORS_SIZE      	;����� ������� ����������

;����������� ���������� 
Timer1CA:   
			cli							; ��������� ������ ����������
            in      r16,pinb            ; ������ ���������� �����
			eor		r16,r17				; ����������� ������� ��� 
			out		portb,r16			; ����� ������ ������� � ����
			sei							; ������ ��������� ����������
			reti	

;����� ����� 
Reset:   	
			;������������� �����
            ldi 	R16,Low(RAMEND)	
		    out 	SPL,R16			
		 	ldi 	R16,High(RAMEND)
		 	out 	SPH,R16
			;.include "coreinit.inc"	        ;������� ������
            ;������������ ������������
			;������������� ������������ 1024 (101) 
			;� ����� ������� �� ���������� (����� CTC)
			lds		r16,tccr1b		
			ori		r16,(0<<cs12)|(1<<cs10)|(1<<wgm12) 
			sts		tccr1b,r16	
			;�������� ���������� �� ���������� � ������ A
            lds		r16,timsk1		
			ori		r16,1<<ocie1a
			sts		timsk1,r16		
			;������������� �������� ��� ��������� 
            ldi     r16,0x10        
            ldi     r17,0x00
            sts     ocr1ah,r17 
            sts     ocr1al,r16 
			;����������� ���� �� �����
            ldi     r16,0x01        
            out     ddrb,r16
            ;����������� ���������			
			ldi		r17,0x01		;�������� ��� ��������
			;sei						;��������� ���������� ���������
			cli

;���� ����������
Main:		;jmp		Main
						
			sbi portb,0		;������� �� 2��� (������ ��������)
			nop
			nop
			cbi portb,0
			rjmp	Main

;EEPROM
	    .ESEG
