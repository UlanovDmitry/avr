
Meander.hex:     формат файла ihex


Дизассемблирование раздела .sec1:

00000000 <.sec1>:
   0:	39 c0       	rjmp	.+114    	;  0x74

Дизассемблирование раздела .sec2:

00000004 <.sec2>:
   4:	18 95       	reti

Дизассемблирование раздела .sec3:

00000008 <.sec3>:
   8:	18 95       	reti

Дизассемблирование раздела .sec4:

0000000c <.sec4>:
   c:	18 95       	reti

Дизассемблирование раздела .sec5:

00000010 <.sec5>:
  10:	18 95       	reti

Дизассемблирование раздела .sec6:

00000014 <.sec6>:
  14:	18 95       	reti

Дизассемблирование раздела .sec7:

00000018 <.sec7>:
  18:	18 95       	reti

Дизассемблирование раздела .sec8:

0000001c <.sec8>:
  1c:	18 95       	reti

Дизассемблирование раздела .sec9:

00000020 <.sec9>:
  20:	18 95       	reti

Дизассемблирование раздела .sec10:

00000024 <.sec10>:
  24:	18 95       	reti

Дизассемблирование раздела .sec11:

00000028 <.sec11>:
  28:	18 95       	reti

Дизассемблирование раздела .sec12:

0000002c <.sec12>:
  2c:	1d c0       	rjmp	.+58     	;  0x68

Дизассемблирование раздела .sec13:

00000030 <.sec13>:
  30:	18 95       	reti

Дизассемблирование раздела .sec14:

00000034 <.sec14>:
  34:	18 95       	reti

Дизассемблирование раздела .sec15:

00000038 <.sec15>:
  38:	18 95       	reti

Дизассемблирование раздела .sec16:

0000003c <.sec16>:
  3c:	18 95       	reti

Дизассемблирование раздела .sec17:

00000040 <.sec17>:
  40:	18 95       	reti

Дизассемблирование раздела .sec18:

00000044 <.sec18>:
  44:	18 95       	reti

Дизассемблирование раздела .sec19:

00000048 <.sec19>:
  48:	18 95       	reti

Дизассемблирование раздела .sec20:

0000004c <.sec20>:
  4c:	18 95       	reti

Дизассемблирование раздела .sec21:

00000050 <.sec21>:
  50:	18 95       	reti

Дизассемблирование раздела .sec22:

00000054 <.sec22>:
  54:	18 95       	reti

Дизассемблирование раздела .sec23:

00000058 <.sec23>:
  58:	18 95       	reti

Дизассемблирование раздела .sec24:

0000005c <.sec24>:
  5c:	18 95       	reti

Дизассемблирование раздела .sec25:

00000068 <.sec25>:
  68:	f8 94       	cli
  6a:	03 b1       	in	r16, 0x03	; 3
  6c:	01 27       	eor	r16, r17
  6e:	05 b9       	out	0x05, r16	; 5
  70:	78 94       	sei
  72:	18 95       	reti
  74:	0f ef       	ldi	r16, 0xFF	; 255
  76:	0d bf       	out	0x3d, r16	; 61
  78:	08 e0       	ldi	r16, 0x08	; 8
  7a:	0e bf       	out	0x3e, r16	; 62
  7c:	00 91 81 00 	lds	r16, 0x0081	;  0x800081
  80:	09 60       	ori	r16, 0x09	; 9
  82:	00 93 81 00 	sts	0x0081, r16	;  0x800081
  86:	00 91 6f 00 	lds	r16, 0x006F	;  0x80006f
  8a:	02 60       	ori	r16, 0x02	; 2
  8c:	00 93 6f 00 	sts	0x006F, r16	;  0x80006f
  90:	00 e1       	ldi	r16, 0x10	; 16
  92:	10 e0       	ldi	r17, 0x00	; 0
  94:	10 93 89 00 	sts	0x0089, r17	;  0x800089
  98:	00 93 88 00 	sts	0x0088, r16	;  0x800088
  9c:	01 e0       	ldi	r16, 0x01	; 1
  9e:	04 b9       	out	0x04, r16	; 4
  a0:	11 e0       	ldi	r17, 0x01	; 1
  a2:	78 94       	sei
  a4:	0c 94 52 00 	jmp	0xa4	;  0xa4
