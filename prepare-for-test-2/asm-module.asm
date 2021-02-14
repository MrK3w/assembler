	bits 64

	section .data
        section .text
extern sentence, val, value, new_value, position, var, ip
global fn, swap_letters,change_letters,swap_bytes, convert_number, index_to_array
global change_pointer

swap_letters:
    enter 0, 0
    mov al, [sentence +0]
    mov cl, [sentence +5]
    mov [sentence + 0], cl
    mov [sentence + 5], al
    leave
    ret

change_letters:
        enter 0,0
        mov byte[sentence +0], 'K'
        leave
        ret

swap_bytes:
        enter 0,0
        mov al, [val]
        mov cl, [val+1]
        mov [val+1], al
        mov [val], cl
        leave
        ret

convert_number:
        enter 0,0
        movsx rax, byte[value]
        mov [new_value], rax
        leave  
        ret

index_to_array:
        enter 0,0
        mov eax, [position]
        mov byte[sentence + eax], 'X'
        leave
        ret

change_pointer:
        enter 0,0
        mov rax, [ip]
        mov rbx, 2
        mov [rax], rbx
        leave  
        ret