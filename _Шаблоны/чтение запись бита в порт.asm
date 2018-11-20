	.include "m328Pdef.inc"   ; Используем ATMega328P
;= Start macro.inc ========================================
 
; Тут будут наши макросы, потом. 
 
;= End macro.inc  ========================================
 
 
; RAM =====================================================
		.DSEG			; Сегмент ОЗУ
 
 
; FLASH ===================================================
		.CSEG			; Кодовый сегмент
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
		.ESEG			; Сегмент EEPROM
