;The semicolon is used to lead an inline documentation
;When you write your program, you could have your info at the top document block
;For Example: Your Name, Student Number, what the program is for, and what it does
;etc.
;
; See if you can figure out what this program does
;
;;; Directives
	PRESERVE8
	THUMB
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x20001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector

; The program
; Linker requires Reset_Handler
	AREA MYDATA, DATA, READONLY
TEXT DCB "ARM assembly language is important to learn!",0	
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
		LDR R0, =TEXT;
		MOV R1, #0; small letters
		MOV R2, #0; capital letters
LOOP	
		LDRB R3, [R0];
		CMP R3, #0;
		BEQ STOP
		CMP R3, #0x41; 'A'
		BLO OVER
		CMP R3, #0x5A; 'Z'
		BLS CAPITAL
		CMP R3, #0x61; 'a'
		BLO OVER
		CMP R3, #0x7A; 'z'
		BHI OVER
		BLS SMALL
CAPITAL	
		ADD R2, R2, #1;
		B OVER
SMALL	ADD R1, R1, #1;
OVER	ADD R0, R0, #0x1;
		B LOOP
STOP
	 B STOP
	END 