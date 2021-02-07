;***************************************************************************
;
; Program for education in subject "Assembly Languages"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Empty project
;
;***************************************************************************
	bits 64

	section .data
; variables

; global

; extern
extern g_pozdrav

        section .text
; functions

; global
global testik

; extern
testik:
	enter 0,0
	mov byte[g_pozdrav + 3], '$'
	leave
	ret
; labels:
