	.include "m328Pdef.inc"   ; ���������� ATMega328P
;= Start macro.inc ========================================
.listmac
.macro	getdg  ;������� ������ ����� �� �������
			ldi		zl,low(digits*2)	; ��������� ����� �������
			ldi		zh,high(digits*2)
			cpi		r16,0				; ��������� ������� ������
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
;.endm
;.macro	wrtdg  ;�������� ������ ����� � �����
			in		r20,pinb			; ������ ������ �� ������
			in		r21,pind
			andi	r20,0xfc			; ����������� �����
			andi	r21,0x03
			add		r20,r16				; ���������� ������
			add		r21,r17
			out		portb,r20			; ����� ������ ������� � ����
			out		portd,r21
.endm 
;= End macro.inc  ========================================
 
 
; RAM =====================================================
		.DSEG			; ������� ���
 


; FLASH ===================================================
		.CSEG			; ������� �������
 	
			ldi		r16,0x03		;����������� �����
			ldi		r17,0xfc
			out		ddrb,r16			
			out		ddrd,r17
			cbi		ddrc,0
			sbi		portc,0
			clr		r18				;������� ������� � ����
			set
loop:		sbis	pinc,0			;��������� ��� C0 
			rjmp	up_level
			brtc	loop			;��������� ����
			clt
			ldi		r16,10				
			rjmp	out_dig
up_level:	brts	loop			
			set
			inc		r18				;����������� �������
			cpi		r18,10			;�������, ���� ������������
			brlo	pc+2
			clr		r18				
			mov		r16,r18
out_dig:	getdg	
			jmp 	loop

digits:		.dw		0x00fc,0x0018,0x016c,0x013c,0x0198
			.dw		0x01b4,0x01f4,0x001c,0x01fc,0x01bc,0x0000  
 
; EEPROM ==================================================
		.ESEG			; ������� EEPROM
