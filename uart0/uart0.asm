		.include "m328Pdef.inc"   	; ���������� ATMega328P
;RAM 
		.DSEG
;FLASH 
        .CSEG				

;������� ����������
		.org $000                   ;Reset interrupt 
		rjmp	Reset
		.org INT_VECTORS_SIZE      	;����� ������� ����������

;����� ����� 
Reset:   	
            ldi 	r16,Low(RAMEND)	;������������� �����
		    out 	spl,r16			
		 	ldi 	r16,High(RAMEND)
		 	out 	sph,r16
                                    ;������������ ������������
            eor     r1,r1           			;baudrate - 16MHz/9600bps (103)
            sts     ubrr0h,r1
            ldi     r24,0x67 
            sts     ubrr0l,r24
            ldi     r24,(1<<rxen0)|(1<<txen0)	;receive,transmit enable
            sts     ucsr0b,r24
            ldi     r24,(3<<ucsz00)				;8bit 1stop
            sts     ucsr0c,r24

;���� ����������
Main:		
            call    UReceive
            inc     r25
            call    UTransmit
            rjmp    Main

;���������
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
