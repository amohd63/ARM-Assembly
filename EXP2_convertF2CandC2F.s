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
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
	MOV R0,#70;
	SUB R1, R0, #32;
	MOV R4, #5;
	MOV R5, #9;
	MUL R1, R1, R4;
	UDIV R1, R1, R5;
	
	MOV R2,#22;
	MUL R3, R2, R5;
	UDIV R3, R3, R4;
	ADD R3, R3, #32;
STOP
	 B STOP
	END 