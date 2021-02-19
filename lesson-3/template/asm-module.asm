	bits 64

	section .data
        section .text
extern g_char_array, g_char_mean

extern g_rgb565_b1, g_rgb565_b2, g_number
global move_blue, mean_char_array, number_mul_100


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

number_mull100:
        enter 0,0
        mov ecx, [g_number]
        shl ecx, 2 ; *4
        mov eax, ecx
        shl eax, 3; 4*8
        add ecx, eax
        shl eax, 1, ;32*2
        add ecx, eax

        mov [g_number], ecx
        leave
        ret