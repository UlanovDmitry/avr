; OUTI	Reg,K			(������������ R16) ������ ����� � ����� ������� �����/������
; OUTU	Reg,Rd			������ ��� � ����� ������� �����/������
; SETBM	Reg,b			��������� ����� ���� ���� � ����� �������� �����/������
; SETB	Reg,b,Rd		��������� ����� ��� ���� � ����� �������� �����/������
; CLRBM	Reg,b			��������� ����� cntr ���� � ����� �������� �����/������
; CLRB	Reg,b,Rd		��������� ����� ��� ���� � ����� �������� �����/������
; INVBM	Reg,b			�������� ����� ���� ���� � ����� �������� �����/������
; INVB	Reg,b,Rd1,Rd2	�������� ����� ��� ���� � ����� �������� �����/������
; PUSHF					������� SREG � R16 � �����
; POPF					����������� SREG � R16 �� �����
;
;

   .macro    OUTI           
      ldi    R16,@1
   .if @0 < 0x40
      out    @0,R16         
   .else
      sts      @0,R16
   .endif
   .endm
;.............................................................
   	.macro    OUTU        
   	.if	@0 < 0x40
      	out	@0,@1         
	.else
      	sts	@0,@1
   	.endif
   	.endm
;.............................................................
;SET BIT with stack
	.MACRO	SETBM 
		.if @0 < 0x20
		SBI		@0,@1
		.else
			.if	@0<0x40
		PUSH	R17
		IN		R17,@1
		ORI		R17,1<<@1
		OUT		@0,R17
		POP		R17
			.else
		PUSH	R17
		LDS		R17,@1
		ORI		R17,1<<@1
		STS		@0,R17
		POP		R17
			.endif
		.endif
	.ENDM
;.............................................................
;SET BIT with REG
	.MACRO	SETB
		.if @0 < 0x20		; Low IO
		SBI		@0,@1
		.else
			.if	@0<0x40		; High IO
		IN		@2,@0
		ORI		@2,1<<@1
		OUT		@0,@2
			.else			; Memory
		LDS		@2,@0
		ORI		@2,1<<@1
		STS		@0,@2
			.endif
		.endif
	.ENDM

;Clear BIT with STACK ============================================
	.MACRO	CLRBM 
	.if @0 < 0x20
	CBI	@0,@1
	.else
		.if @0<0x40
	PUSH	R17
	IN	R17,@0
	ANDI	R17,~(1<<@1)
	OUT	@0,R17
	POP	R17
		.else
	PUSH	R17
	LDS	R17,@0
	ANDI	R17,~(1<<@1)
	STS	@0,R17
	POP	R17
		.endif
	.endif
	.ENDM	
;.............................................................
;Clear BIT with REG
	.MACRO	CLRB
		.if @0 < 0x20		; Low IO
		CBI		@0,@1
		.else
			.if	@0<0x40		; High IO
		IN		@2,@0
		ANDI	@2,~(1<<@1)
		OUT		@0,@2
			.else			; Memory
		LDS		@2,@0
		ANDI	@2,~(1<<@1)
		STS		@0,@2
			.endif
		.endif
	.ENDM
 
;---------------------------------------------------------------------------	
	.MACRO	INVB
	.if	@0 < 0x40
	IN	@2,@0
	LDI	@3,1<<@1
	EOR	@3,@2
	OUT	@0,@3
	.else
	LDS	@2,@0
	LDI	@3,1<<@1
	EOR	@2,@3
	STS	@0,@2
	.endif
	.ENDM
 
;---------------------------------------------------------------------------	
	.MACRO	INVBM
	.if	@0 < 0x40
	PUSH	R16
	PUSH	R17
	IN	R16,@0
	LDI	R17,1<<@1
	EOR	R17,R16
	OUT	@0,R17
	POP	R17
	POP	R16
	.else
	PUSH	R16
	PUSH	R17
	LDS	R16,@0
	LDI	R17,1<<@1
	EOR	R17,R16
	STS	@0,R17
	POP	R17
	POP	R16
	.endif
	.ENDM
;---------------------------------------------------------------------------		
	.MACRO PUSHF
		PUSH	R16
		IN	R16,SREG
		PUSH	R16
	.ENDM
 
;---------------------------------------------------------------------------	 
	.MACRO POPF
		POP	R16
		OUT	SREG,R16
		POP	R16
	.ENDM
;---------------------------------------------------------------------------		
;USART INIT
;		.equ MainClock 		= 8000000				; CPU Clock
;		.equ baudrate 		= 9600

			.MACRO	USART_INIT
			.equ bauddivider 	= MainClock/(16*baudrate)-1

			
			OUTI 	UBRRL,low(bauddivider)
			OUTI 	UBRRH,high(bauddivider)
			OUTI 	UCSRA, 0
			OUTI 	UCSRB,(1<<RXEN)|(1<<TXEN)|(1<<RXCIE)|(1<<TXCIE)
			OUTI 	UCSRC,(1<<URSEL)|(1<<UCSZ0)|(1<<UCSZ1)
			.ENDM
;---------------------------------------------------------------------------	
