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
  	extern g_znak, g_cislo32, g_cislo64
	extern g_pole_znaky, g_pole_cislo32, g_pole_cislo64
	extern g_index, g_hodnota;

        section .text
; functions
; global
	global nastav_promenne, presun_promenne,nastav_pole_znaku
	global nastav_pole_cislo64, nastav_pole_cislo_32_index
	global nastav_pole_cislo32_index_32, presun_pole_znaky_cislo32

presun_pole_znaky_cislo32:
	enter 0,0
	;znaky[k] = gpole_cislo32[k]
	mov ecx, [g_pole_cislo32 + 0 * 4]
	mov [g_pole_znaky + 0], cl
	mov ecx, [g_pole_cislo32 + 1 * 4] 
	mov [g_pole_znaky + 1], cl
	mov ecx, [g_pole_cislo32 + 2 * 4]
	mov [g_pole_znaky + 2], cl
	mov ecx, [g_pole_cislo32 + 3 * 4]
	mov [g_pole_znaky + 3], cl
	mov ecx, [g_pole_cislo32 + 4 * 4]
	mov [g_pole_znaky + 4], cl
	leave
	ret

nastav_pole_cislo32_index_32:
	enter 0,0
	;mov ecx, [g_hodnota]
	mov eax, [g_cislo32]
	movsx rcx, dword[g_index]
	;mov edx, [g_index]
	mov [g_pole_cislo32 + rcx *4], eax
	leave
	ret
nastav_pole_cislo_32_index:
	enter 0,0
	; g_pole_cislo32_index[g_index] = 3333
	;32 bit to 64 so we must use movsx
	movsx rax, dword[g_index]
	mov dword[g_pole_cislo32 + rax * 4], 3333
	leave
	ret

nastav_pole_cislo64:
	enter 0,0
	mov qword[g_pole_cislo64],1
	mov qword[g_pole_cislo64 + 1 * 8],1000
	mov qword[g_pole_cislo64 + 3 * 8],3000
	mov qword[g_pole_cislo64 + 5 * 8],5000
	mov qword[g_pole_cislo64 + 7 * 8],7000
	mov qword[g_pole_cislo64 + 9 * 8],9000
	leave
	ret



presun_promenne:
	enter 0,0
	movsx rax, dword[g_cislo32]
	mov [g_cislo64], rax

	movsx eax, byte[g_znak]
	mov [g_cislo32], eax

	leave
	ret

nastav_pole_znaku:
	enter 0,0

	mov byte[g_pole_znaky], 'p'
	mov byte[g_pole_znaky + 1], 'O'
	mov byte[g_pole_znaky + 2], 'O'
	mov byte[g_pole_znaky + 3], 'z'
	leave
	ret

nastav_promenne:
	enter 0,0
	mov byte [ g_znak ], 'x'
	mov dword [g_cislo32], 326232
	mov qword [g_cislo64], 646646464
	leave
	ret
; labels:
