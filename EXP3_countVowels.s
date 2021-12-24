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
		MOV R1, #0; vowels
		MOV R2, #0; non-vowels
LOOP	
		LDRB R3, [R0];
		CMP R3, #0;
		BEQ STOP
		CMP R3, #0x41; 'A'
		BLO OVER
		CMP R3, #0x5A; 'Z'
		BLS COUNT
		CMP R3, #0x61; 'a'
		BLO OVER
		CMP R3, #0x7A; 'z'
		BHI OVER
		BLS COUNT
COUNT	
		CMP R3, #0x61; 'a'
		BEQ VOWEL
		CMP R3, #0x65; 'e'
		BEQ VOWEL
		CMP R3, #0x69; 'i'
		BEQ VOWEL
		CMP R3, #0x6F; 'o'
		BEQ VOWEL
		CMP R3, #0x75; 'u'
		BEQ VOWEL
		CMP R3, #0x41; 'A'
		BEQ VOWEL
		CMP R3, #0x45; 'E'
		BEQ VOWEL
		CMP R3, #0x49; 'I'
		BEQ VOWEL
		CMP R3, #0x4F; 'O'
		BEQ VOWEL
		CMP R3, #0x55; 'U'
		BEQ VOWEL
		ADD R2, R2, #1;
		B OVER
VOWEL	ADD R1, R1, #1;
OVER	ADD R0, R0, #0x1;
		B LOOP
STOP
	 B STOP
	END 