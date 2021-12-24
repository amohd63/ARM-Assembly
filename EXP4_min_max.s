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
Max DCD 0
MaxP DCD Max
Min DCD 0
MinP DCD Min
N DCD 12
NUM1 DCD 3, -7, 2, -2, 10, 20, 30, 15, 32, 8, 64, 66
POINTER DCD NUM1
; The program
; Linker requires Reset_Handler
	 AREA MYCODE, CODE, READONLY
	 ENTRY
	 EXPORT Reset_Handler
Reset_Handler
	LDR R0, MaxP;
	LDR R1, MinP;
	LDR R2, N;
	LDR R3, POINTER;
	MOV R4, #0x80000000;
	MOV R5, #0; ;;min
	MOV R6, #0; ;;max
	LDR R5, [R3];
	LDR R6, [R3];
	MOV R10, #0xFFFFFFFF;
LOOP
	LDR R7, [R3];
	AND R8, R7, R4;
	CMP R8, R4;
	BEQ NEGATIVE1
	MOVGT R6, R7;
	B SKIP1
NEGATIVE1
	SUBEQ R7, R10, R7;
	ADDEQ R7, R7, #1;
	AND R8, R5, R4;
	CMP R8, R4;
	BEQ NEGATIVE2
	B SKIP2
SKIP2
	LDR R7, [R3];
	MOV R5, R7;
	B SKIP1
NEGATIVE2
	SUBEQ R9, R10, R5;
	ADDEQ R9, R9, #1;
	CMPEQ R7, R5;
	LDRGT R7, [R3];
	MOV R5, R7;
SKIP1 ADD R3, R3, #4;
	SUBS R2, R2, #1;
	BGT LOOP
HERE B HERE
	ALIGN
	END;
;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;;;;;;
; Add code below to find the maximum value and
; the minimum value in the number array NUM1.
; You can use the example in the notes as a reference.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;