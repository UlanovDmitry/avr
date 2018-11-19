	.include "m328Pdef.inc"   ; Используем ATMega328P

; RAM 
		.DSEG			; Сегмент ОЗУ
 
; FLASH 
		.CSEG			; Кодовый сегмент
 	nop
	nop
	nop
	jmp 0x000006
	nop
	nop
	nop
	rjmp PC-6
 
; EEPROM 
		.ESEG			; Сегмент EEPROM
