;= Start macro.inc ========================================
   .macro    OUTI         ; ��� �������� �������. ����� ��� outi ���������� � ����, �� ���������� ��
      ldi    R16,@1
   .if @0 < 0x40
      out    @0,R16         ; �������. ������ ������ ���� �������� ��������� ����� ������� � ������� R16, � �� ����
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