;= Start macro.inc ========================================
   .macro    OUTI         ; Ёто описание макроса. ¬езде где outi встретитс€ в коде, то замен€етс€ на
      ldi    R16,@1
   .if @0 < 0x40
      out    @0,R16         ; макроса. ƒанный макрос тупо копирует введенное число сначала в регистр R16, а из него
   .else
      sts      @0,R16
   .endif
   .endm

   	.macro    UOUT        
   	.if	@0 < 0x40
      	out	@0,@1         
	.else
      	sts	@0,@1
   	.endif
   	.endm
	
	.MACRO PUSHF
	PUSH R16
	IN R16,SREG
	PUSH R16
	.ENDM
	.MACRO POPF
	POP R16
	OUT SREG,R16
	POP R16
	.ENDM
;= End macro.inc ========================================