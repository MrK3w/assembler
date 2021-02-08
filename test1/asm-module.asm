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
extern login_num, letters, digits, login, g_auto, apps_max, remaining_point, cheaters_remaining_points

        section .text
; functions
; global
global swap_endian, build_login, prohod, apps_max_matrix, convert8_to_64
; extern

; labels:
swap_endian:
	enter 0,0
	mov ah, [login_num]
	mov al, [login_num+1]
	mov [login_num], ah
	mov [login_num+1], al
	leave
	ret

prohod:
	enter 0,0
	mov al, [g_auto +0]
	mov cl, [g_auto +5]
	mov [g_auto + 0], cl
	mov [g_auto + 5], al
	mov al, [g_auto +1]
	mov cl, [g_auto +4]
	mov [g_auto + 1], cl
	mov [g_auto + 4], al
	mov al, [g_auto +2]
	mov cl, [g_auto +3]
	mov [g_auto + 2], cl
	mov [g_auto + 3], al
	leave
	ret

build_login:

	enter 0,0

	mov al, [letters + 0]

	mov [login+0], al

	mov al, [letters + 1]

	mov [login+1], al

	mov al, [letters + 2]

	mov [login+2], al

	mov al, [digits+0*4]

	mov [login+3], al

	mov al, [digits+1*4]

	mov [login+4], al

	mov al, [digits+2*4]

	mov [login+5], al

	mov al, [digits+3*4]

	mov [login+6], al

	mov byte[login+7], 0h

	leave

	ret


apps_max_matrix:
	enter 0,0
	mov eax, [apps_max + 4 * 8]
	mov [apps_max + 4 * 9], eax
	mov eax, [apps_max + 4 * 7]
	mov [apps_max + 4 * 8], eax
	mov eax, [apps_max + 4 * 6]
	mov [apps_max + 4 * 7], eax
	mov dword[apps_max + 4 * 3], 2
	mov dword[apps_max + 4 * 4], 3
	mov dword[apps_max + 4 * 5], 3
	mov dword[apps_max + 4 * 6], 4
	leave
	ret

convert8_to_64:
	enter 0,0
	movsx rax, byte[remaining_point]
	mov [cheaters_remaining_points], rax 
	leave
	ret
