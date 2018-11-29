		.include "m328Pdef.inc"   	; ���������� ATMega328P
		.include "macro.inc"		; ���������� �������
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
            set	
			reti	

;����� ����� 
Reset:   	
            ldi 	R16,Low(RAMEND)	;������������� �����
		    out 	SPL,R16			
		 	ldi 	R16,High(RAMEND)
		 	out 	SPH,R16
;.include "coreinit.inc"	        ;������� ������
            ;������������ ������������
			lds		r16,tccr1b		;������������� ������������ 1024 (101) 
			ori		r16,(1<<cs12)|(1<<cs10)|(1<<wgm12) ;� ����� ������� �� ���������� (����� CTC)
			sts		tccr1b,r16	
            lds		r16,timsk1		;�������� ���������� �� ���������� � ������ A
			ori		r16,1<<ocie1a
			sts		timsk1,r16		
            ldi     r16,0x09        ;������������� �������� ��� ��������� (32768)
            ldi     r17,0x3d
            sts     ocr1ah,r17 
            sts     ocr1al,r16 
            ;����������� ���������
            clr     r18             ;������� ������� � ����
            clt
			sei						;��������� ���������� ���������

;���� ����������
Main:
            brtc    Main            ;��������� ���� �� ����� �����
            clt                     ;c��������� ����
			inc		r18			    ;����������� �������
			cpi		r18,10		    ;�������, ���� ������������
			brlo	pc+2
			clr		r18				
			mov		r16,r18
            call    WriteDigit      ;��������� ��������� ������ �����
			jmp	Main

;���������
WriteDigit:  ;�������� ������ ����� � �����
			ldi		zl,low(digits*2)	; ��������� ����� �������
			ldi		zh,high(digits*2)
			cpi		r16,0				; ��������� ����� �� �������
			brlo	outbnds
			cpi		r16,10
			brsh	outbnds			
			lsl		r16					; ��������� ��������
			rjmp	addshift				
outbnds:	ldi		r16,10*2
addshift:	clr		r17					; ���������� ��������
			add		zl,r16
			adc		zh,r17
			lpm		r17,z+				; ��������� ������ �� �������
			lpm		r16,z
			in		r20,pinb			; ������ ������ �� ������
			in		r21,pind
			andi	r20,0xfc			; ����������� �����
			andi	r21,0x03
			add		r20,r16				; ���������� ������
			add		r21,r17
			out		portb,r20			; ����� ������ ������� � ����
			out		portd,r21
            ret

;������ � ������ ��������
digits:		.dw		0x00fc,0x0018,0x016c,0x013c,0x0198
			.dw		0x01b4,0x01f4,0x001c,0x01fc,0x01bc,0x0000  

;EEPROM
	    .ESEG
