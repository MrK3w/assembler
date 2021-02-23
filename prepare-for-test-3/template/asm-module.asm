	bits 64

	section .data
        section .text
extern g_char_array, g_char_mean, rousek, respiratoru, skafandru

extern g_rgb565_b1, g_rgb565_b2, g_number, g_int_array, g_suma, pal, sentence, velkych, tecek 

extern enemyHps, enemiesCount, strongestEnemyHP, strongestEnemy, selectedEnemy, health_in_rounds, rounds

extern g_kladna, g_zaporna, g_string, g_string_len, nums, result, len, rgb888, rgb565, chat_message, negative
global move_blue, mean_char_array, number_mul100, suma_int_array, string_len
global array_len, detect_palindrom

global count_numbers, string_low, login_i32, rgb888_to_rgb565
global enemy_selector, chat_cleaner, attack_simulator, prevodnik, positive_censure

positive_censure:
        enter 0,0
        mov rdx, 0
.back:
        cmp byte[negative+rdx], 0
        je .konec
        cmp byte[negative+rdx], ':'
        je .nalezeno
        inc rdx
        jmp .back
.nalezeno:
        cmp byte[negative + rdx+1], '(' 
        je .zmena
        inc rdx
        jmp .back
.zmena:
        mov byte[negative+rdx+1], ')'
        inc rdx
        jmp .back
.konec:
        leave
        ret


prevodnik:
        enter 0,0
        mov ax, [respiratoru]
        mov bx, [respiratoru]
        shl ax, 1
        shr bx, 2
        mov [rousek], ax
        mov [skafandru], bx
        leave
        ret

attack_simulator:
        enter 0,0
        mov ax, [selectedEnemy]
        mov bx, [enemyHps+eax*2]
        mov dword[rounds], 0
        mov edx, 0
.back:
        cmp bx, 0
        jl .end
        sub bx, 240
        mov [health_in_rounds+edx*2], bx
        inc edx
        jmp .back
.end:
        mov [rounds],edx
        leave
        ret

chat_cleaner:
        enter 0,0
        sub byte[chat_message+rdx], 'a' - 'A'
        mov rdx, 1
.back:
        cmp byte[chat_message+rdx], 0
        je .konec
        cmp byte[chat_message+rdx], '.'
        je .konec
        cmp byte[chat_message+rdx], 'A'
        jb .nezajem
        cmp byte[chat_message+rdx], 'Z'
        ja .nezajem
        ; 'a' - 'A'
        add byte[chat_message + rdx], 'a' - 'A' 
        inc rdx
.nezajem:
        inc rdx
        jmp .back
.konec:
        mov byte[chat_message+rdx], 0h
        leave
        ret

enemy_selector:
        enter 0,0
        mov eax, 0
        mov cx, [enemyHps]
.back:
        cmp eax, [enemiesCount]
        jge .endfor
        cmp cx, [enemyHps+eax*2]
        jl .found_bigger
        inc eax
        jmp .back
.found_bigger:
        mov [strongestEnemy],eax
        mov dx, [enemyHps+eax*2]
        mov [strongestEnemyHP], dx
        inc eax
        jmp .back
.endfor:

        leave
        ret


rgb888_to_rgb565:
        enter 0,0
        mov al, [rgb888]
        shr al, 3
        mov [rgb565], al
        mov al, [rgb888+1]
        shr al, 2
        movsx bx, al
        shl bx, 5

        or [rgb565], bx
        mov al,[rgb888+2]
        shr al, 3
        movsx bx, al
        shl bx, 3
        or [rgb565+1], bx
        leave
        ret

login_i32:
        enter 0,0
        mov edx, 0
.back:
        cmp edx, [len]
        jge .end
        mov eax, [nums+4*rdx]
        mov ebx, eax
        shl ebx, 3
        add eax, ebx
        shl ebx, 1
        add eax, ebx
        shl ebx, 1
        add eax, ebx
        movsx rcx, eax
        mov [result+8*rdx], rcx
        inc rdx
        jmp .back

.end:
        leave
        ret

string_low:
        enter 0,0
        mov rdx, 0

.back:
        cmp byte[g_string+rdx], 0
        je .konec
        cmp byte[g_string+rdx], 'A'
        jb .nezajem
        cmp byte[g_string+rdx], 'Z'
        ja .nezajem
        ; 'a' - 'A'
        add byte[g_string + rdx], 'a' - 'A' 
.nezajem:
        inc rdx
        jmp .back
.konec:
        leave
        ret
move_blue:
        enter 0,0
        mov ax, 0b11111 ;blue mask
        mov cx, [g_rgb565_b1]
        and cx, ax ;only blue
        not ax ;mask for green and red
        and [g_rgb565_b2], ax ;only red and gren
        or [g_rgb565_b2], cx
        leave
        ret

mean_char_array:
        enter 0,0
        
        movsx rax, byte[g_char_array] ;sum
        movsx rcx, byte[g_char_array + 1]
        add rax, rcx 
        movsx rcx, byte[g_char_array + 2]
        add rax, rcx 
        movsx rcx, byte[g_char_array + 3]
        add rax, rcx 

        shr rax, 2  ;sum /=4
        mov [g_char_mean], al
        leave
        ret

number_mul100:
        enter 0,0
        mov ecx, [g_number]
        shl ecx, 2
        mov ebx, ecx
        shl ebx, 3
        add ecx, ebx
        shl ebx, 1
        add ecx, ebx
        mov [g_number], ecx
        leave
        ret

suma_int_array:
        enter 0,0
        xor eax, eax ; mov eax, 0 ;sub eax, eax
        ; for (rdx 0 rdx < 10; rdx++)
        mov rdx, 0
.back:
        cmp rdx, 10 ;sub rdx, 10
        jge .endfor
        add eax, [g_int_array + rdx*4]
        inc rdx
        jmp .back
        ;endfor
.endfor:
        mov [g_suma], eax
        leave
        ret

count_numbers:
        enter 0,0
        mov rdx, 0
.back:
        cmp rdx, 10
        jge .endfor
        cmp dword[g_int_array+rdx*4], 0
        je .continue
        jg .vetsi
        inc dword[g_zaporna]
        jmp .continue


.vetsi:
        inc dword[g_kladna]
.continue:
        inc rdx
        jmp .back
.endfor:
        leave
        ret

string_len:
        enter 0,0
        mov rdx, g_string ; char *ptr = g_string
.back:
        cmp byte [rdx], 0 ;*ptr ==0
        je .konec
        inc rdx
        jmp .back
.konec:
        sub rdx, g_string ;return ptr- g_string
        mov [g_string_len], edx
        leave
        ret

array_len:
        enter 0,0
        mov rdx, g_int_array
.back:
        cmp dword [rdx], 40;*ptr ==0
        je .konec
        inc rdx
        jmp .back
.konec:
        sub rdx, g_int_array ;return ptr- g_string
        mov [g_string_len], edx
        leave
        ret
