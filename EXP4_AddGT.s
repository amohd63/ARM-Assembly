;The semicolon is uded to lead an inline documentation
;When you write your program, you could have your info at the top document lock
;For Example: Your Name, Student Number, what the program is for, and what it does
;etc.
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

	ALIGN

;Your Data section
;AREA DATA
SUM DCD 0
SUMP DCD SUM
N DCD 7
NUM1 DCD 3, -7, 2, -2, 10, 20, 30
POINTER DCD NUM1
; The program
; Linker requires Reset_Handler
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	MOV R0, #0; ;sum
	LDR R1, =SUM;
	LDR R2, POINTER;
	LDR R3, N;
	MOV R4, #0x80000000;
	MOV R5, #5;
LOOP
	LDR R6, [R2];
	AND R7, R6, R4;
	CMP R7, R4;
	BEQ SKIP
	CMP R6, R5;
	ADDGT R0, R0, R6;
SKIP	ADD R2, R2, #4;
	SUBS R3, R3, #1;
	BGT LOOP
	STR R0, [R1];
	LDR R8, [R1];
HERE	B HERE
	ALIGN
	END;
;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
; Please complete the program to add up all the
; numbers in the array NUM1 that are greater than 5.
; Put the sum in the register R0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
