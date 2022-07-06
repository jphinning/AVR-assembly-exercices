;
; AssemblerApplication1.asm
;
; Created: 01/07/2022 22:05:22
; Author : Aluno
;


; Replace with your application code
start:
    ldi r16, 0xFF
	out DDRB, r16
	ldi r16, 0x01
	ldi r18, 0x1

loop:
	out PORTB, r18
	call delay
	rol r18
	brcs set_lsb
	rjmp loop

set_lsb:
	rol r18
	rjmp loop

delay:
	ldi r21, 94
	ldi r22, 100
	ldi r23, 100
loop_delay:
	dec r21
	brne loop_delay
	ldi r21, 100
	dec r22
	brne loop_delay
	ldi r22, 100
	dec r23
	brne loop_delay
	ret

