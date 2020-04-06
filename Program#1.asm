TITLE Project #1     (Program#1.asm)

; Author:Brandon Schultz
; Last Modified: 10-8-19
; OSU email address: bschultz@tmcc.edu
; Course number/section: CS 271 400 Fall 2019
; Project Number: One                 Due Date: 10-13-19
; Description: Contains MASM program that:
; Displays my name and programs title
; Prompts user to enter two values
; Calculates sum, difference, product, quotient (including remainder value) and displays values to user.
; Prompts user to play again, or exit program and display a terminating message.

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
a					DWORD ?
b					DWORD ?
q					DWORD ?
sumValue			DWORD 0
ansValue			DWORD 0
remValue			DWORD 0
displayName			BYTE	"Brandon Schultz ", 0;
displayProgram		BYTE	"CS_271 Program #1 An Introduction to MASM assembly language. ", 0;
displayECPrompt		BYTE	"** EC: Program checks that second value entered is < the first. ", 0;
displayRules		BYTE    "Enter Two Values to obtain their sum, difference, product and quotient values. (One value per prompt) ", 0;
askValueFirst		BYTE	"Value One: ", 0;
askValueSecond		BYTE	"Value Two: ", 0;
displayRemainder	BYTE	" Remainder = ", 0;
displayExitPrompt	BYTE	"To play again press 1. To exit press any other key.", 0;
displayExitPrompt1	BYTE	"Thanks for playing!", 0;
diplayInvalidValInp	BYTE	"Second value choice must be < than the first. Choosing 1, then 0 will crash program. Calculate at your own risk.", 0;
plus	BYTE	" + ", 0;
subt	BYTE	" - ", 0;
mult	BYTE	" x ", 0;
dive	BYTE	" / ", 0;
equal	BYTE	" = ", 0;

.code
main PROC
true1:

		; Displays my name.
		mov		edx, OFFSET	displayName
		call	WriteString
		call	Crlf

	    ; Displays projects name.
		mov		edx, OFFSET	displayProgram
		call	WriteString
		call	Crlf

		; Displays that EC option one was implemented.
		mov		edx, OFFSET	displayECPrompt
		call	WriteString
		call	Crlf

		; Displays programs rules/purpose.
		mov		edx, OFFSET	displayRules
		call	WriteString
		call	Crlf

		; Prompts user for input value one.
		mov		edx, OFFSET	askValueFirst
		call	WriteString
		call	ReadInt
		mov		a, eax

		; Prompts user for input value two.
		mov		edx, OFFSET askValueSecond
		call	WriteString
		call	ReadInt
		mov		b, eax

		; Input Validation, checks that value 1 > 2.
		mov		eax, a
		cmp		eax, b
		JL		true3
		jmp		true2

true2:
		; Methods for calculating and displaying entered value's sum.
		mov		eax, 0
		mov		eax, a
		add		eax, b
		mov		sumValue, eax
		mov		eax, a
		call	WriteDec; display a
		mov		edx, OFFSET plus
		call	WriteString
		mov		eax, b
		call	WriteDec; display b
		mov		edx, OFFSET equal
		call	WriteString
		mov		eax, sumValue
		call	WriteDec; display sumValue
		call	Crlf

		; Methods for calculating and displaying entered value's difference.
		mov		eax, 0
		mov		eax, a
		sub		eax, b
		mov		ansValue, eax
		mov		eax, a
		call	WriteDec; display a
		mov		edx, OFFSET subt
		call	WriteString
		mov		eax, b
		call	WriteDec; display b
		mov		edx, OFFSET equal
		call	WriteString
		mov		eax, ansValue
		call	WriteDec; display sub
		call	Crlf

		; Methods for calculating and displaying entered value's product.
		mov		eax, 0
		mov		eax, a
		mul		b
		mov		ansValue, eax
		mov		eax, a
		call	WriteDec; display a
		mov		edx, OFFSET mult
		call	WriteString
		mov		eax, b
		call	WriteDec; display b
		mov		edx, OFFSET equal
		call	WriteString
		mov		eax, ansValue
		call	WriteDec; display sub
		call	Crlf

		; Methods for calculating and displaying entered value's quotient and Remainder if applicable.
		mov		eax, 0
		mov		eax, a
		xor		edx,edx
		div		b
		mov		remValue,edx
		mov		ansValue, eax
		mov		eax, a
		call	WriteDec; display a
		mov		edx, OFFSET dive
		call	WriteString
		mov		eax, b
		call	WriteDec; display b
		mov		edx, OFFSET equal
		call	WriteString
		mov		eax, ansValue
		call	WriteDec; display /
		mov		edx, OFFSET displayRemainder
		call	WriteString
		mov		eax, remValue
		call	WriteDec; display remainder
		call	Crlf
		call	Crlf
		mov		edx, OFFSET displayExitPrompt
		call	WriteString
		call	ReadInt
		mov		q,eax
		cmp		q, 1
		JE		true1
		mov		edx, OFFSET displayExitPrompt1
		call	WriteString
		call	Crlf
		jmp		theEnd

true3:
		; Prompts user to enter different values if Value 1 < value 2, or 1, then 0 is chosen.
		mov		edx, OFFSET	diplayInvalidValInp
		call	WriteString
		call	Crlf

		; Asks user to continue playing, or exit program. Displays exit prompt if user chooses to quit.
		mov		edx, OFFSET displayExitPrompt
		call	WriteString
		call	ReadInt
		mov		q, eax
		cmp		q, 1
		JE		true1
		mov		edx, OFFSET displayExitPrompt1
		call	WriteString
		call	Crlf
		jmp		theEnd

theEnd:
	exit
main ENDP


END main
