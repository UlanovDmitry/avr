	.include "m328Pdef.inc"   ; ���������� ATMega328P

; RAM 
		.DSEG			; ������� ���
 
; FLASH 
		.CSEG			; ������� �������
 	nop
	nop
	nop
	jmp 0x000006
	nop
	nop
	nop
	rjmp PC-6
 
; EEPROM 
		.ESEG			; ������� EEPROM
