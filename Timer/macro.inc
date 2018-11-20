;= Start macro.inc ========================================

.macro pushf
		push r16
		in r16,sreg
		push r16
.endm

.macro popf
		pop r16
		out sreg,r16
		pop r16
.endm

.macro gett0
		cli
		out tcnt0,r16
		push r16
		sei
.endm

;= End macro.inc ========================================
