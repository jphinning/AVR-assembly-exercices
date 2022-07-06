;
; AssemblerApplication2.asm
;
; Created: 03/07/2022 19:38:52
; Author : jphin
;


; Replace with your application code
.equ meuPTR_low = 0x00
.equ meuPTR_high = 0x02

counterBytes: .db	0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,0b01111101,0b00000111,0b01111111,0b01100111


start:
	ldi r16, 0x7F
	out DDRB, r16
	out DDRD, r16
	ldi r16, 0
	ldi r20, 0

loop:
	;digito
	mov r30, r16
	lpm r17, Z
	out PORTB, r17
	;dezena
	mov r30, r20
	lpm r17, Z
	out PORTD, r17
	call delay
	inc r16
	cpi r16, 0x0A
	brne loop
	ldi r16, 0
	inc r20
	cpi r20, 0x0A
	brne loop
	ldi r20, 0
	rjmp loop

/*start:
	ldi r26, meuPTR_low
	ldi r27, meuPTR_high
	ldi r16, 0b00111111		; 0 em 7seg
	st X+, r16
	ldi r16, 0b00000110		; 1 em 7seg
	st X+, r16
	ldi r16, 0b01011011		; 2 em 7seg
	st X+, r16
	ldi r16, 0b01001111		; 3 em 7seg
	st X+, r16
	ldi r16, 0b01100110		; 4 em 7seg
	st X+, r16
	ldi r16, 0b01101101		; 5 em 7seg
	st X+, r16
	ldi r16, 0b01111101		; 6 em 7seg
	st X+, r16
	ldi r16, 0b00000111		; 7 em 7seg
	st X+, r16
	ldi r16, 0b01111111		; 8 em 7seg
	st X+, r16
	ldi r16, 0b01100111		; 9 em 7seg
	st X+, r16

	ldi r16, 0x7F
	out DDRB, r16
	out DDRD, r16
	ldi r16, 0
	ldi r20, 0

loop:
	mov r26, r16		; para escrever a unidade
	ld r17, X
	out PORTB, r17
	mov r26, r20		; para escrever a dezena
	ld r17, X
	out PORTD, r17
	call delay		; atraso de 1s (funcao delay)
	inc r16
	cpi r16, 0x0A
	brne loop
	ldi r16, 0
	inc r20
	cpi r20, 0x0A
	brne loop
	ldi r20, 0
	rjmp loop*/


; Atraso de aproximadamente 1s
delay:
	ldi r21, 94
	ldi r22, 100
	ldi r23, 33
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

