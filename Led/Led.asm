	.include "m328Pdef.inc"   ; Используем ATMega328P
;= Start macro.inc ========================================
.listmac
.macro	getdg  ;извлечь шаблон цифры из таблицы
			ldi		zl,low(digits*2)	; загружаем адрес таблицы
			ldi		zh,high(digits*2)
			cpi		r16,0				; проверяем входные данные
			brlo	outbnds
			cpi		r16,10
			brsh	outbnds			
			lsl		r16					; вычисляем смещение
			rjmp	addshift				
outbnds:	ldi		r16,10*2
addshift:	clr		r17					; прибавляем смещение
			add		zl,r16
			adc		zh,r17
			lpm		r17,z+				; загружаем шаблон из таблицы
			lpm		r16,z
;.endm
;.macro	wrtdg  ;записать шаблон цифры в порты
			in		r20,pinb			; читаем данные из портов
			in		r21,pind
			andi	r20,0xfc			; накладываем маску
			andi	r21,0x03
			add		r20,r16				; прибавляем шаблон
			add		r21,r17
			out		portb,r20			; пишем данные обратно в порт
			out		portd,r21
.endm 
;= End macro.inc  ========================================
 
 
; RAM =====================================================
		.DSEG			; Сегмент ОЗУ
 


; FLASH ===================================================
		.CSEG			; Кодовый сегмент
 	
			ldi		r16,0x03		;настраиваем порты
			ldi		r17,0xfc
			out		ddrb,r16			
			out		ddrd,r17
			cbi		ddrc,0
			sbi		portc,0
			clr		r18				;готовим счетчик и флаг
			set
loop:		sbis	pinc,0			;проверяем пин C0 
			rjmp	up_level
			brtc	loop			;проверяем флаг
			clt
			ldi		r16,10				
			rjmp	out_dig
up_level:	brts	loop			
			set
			inc		r18				;увеличиваем счетчик
			cpi		r18,10			;очищаем, если переполнение
			brlo	pc+2
			clr		r18				
			mov		r16,r18
out_dig:	getdg	
			jmp 	loop

digits:		.dw		0x00fc,0x0018,0x016c,0x013c,0x0198
			.dw		0x01b4,0x01f4,0x001c,0x01fc,0x01bc,0x0000  
 
; EEPROM ==================================================
		.ESEG			; Сегмент EEPROM
