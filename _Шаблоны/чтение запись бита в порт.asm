	.include "m328Pdef.inc"   ; ���������� ATMega328P
;= Start macro.inc ========================================
 
; ��� ����� ���� �������, �����. 
 
;= End macro.inc  ========================================
 
 
; RAM =====================================================
		.DSEG			; ������� ���
 
 
; FLASH ===================================================
		.CSEG			; ������� �������
 		cbi   ddrb,2
		sbi	  portb,2
		sbi   ddrc,0
start:	sbic  pinb,2
		rjmp  off
		sbi   portc,0
		rjmp  start
off:	cbi   portc,0
		rjmp  start
 
; EEPROM ==================================================
		.ESEG			; ������� EEPROM
