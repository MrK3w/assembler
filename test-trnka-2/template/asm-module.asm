	bits 64

	section .data
        section .text
extern sentence, left, right, combined, belt, before_combined
extern split_left, split_right, chest, itemsIndexes, belt1,belt2, final_product
global speechspeed, combine_items, belt_move, combine, box_take_items, assembler
speechspeed:
    ;012345678
    enter 0, 0
    mov al, [sentence + 7]
    mov cl, [sentence + 8]
    mov [sentence + 9], al
    mov [sentence + 10], cl
    mov al, [sentence + 5]
    mov cl, [sentence + 6]
    mov [sentence + 7], al
    mov [sentence + 8], cl
    mov byte[sentence + 4], 'e'
    mov byte[sentence + 5], 'j'
    mov byte[sentence + 6], ' '
    mov byte[sentence +11], 0h
    leave
    ret

combine_items:
        enter 0,0
        mov ax, [right]
        mov [combined+1*2], ax
        mov ax, [left]
        mov [combined], ax
        leave
        ret

belt_move:
        enter 0,0
        mov eax, [belt + 5 *4 ]
        mov ebx, [belt + 0 * 4]
        mov [belt + 0 *4], eax
        mov eax, [belt + 1 * 4] 
        mov [belt + 1 *4], ebx
        mov ebx, [belt + 2 * 4]
        mov [belt + 2 *4], eax
        mov eax, [belt + 3 *4]
        mov [belt + 3 *4], ebx
        mov ebx, [belt + 4 *4]
        mov [belt + 4 * 4], eax
        mov [belt + 5 * 4], ebx
        leave
        ret

combine:
        enter 0,0
        mov ax, [before_combined]
        mov [split_right], ax
        mov word[split_right+2], 0
        mov ax, [before_combined + 2]
        mov [split_left+2], ax
        mov word[split_left], 0
        leave
        ret

box_take_items:
        enter 0,0

        mov al, [itemsIndexes]
        movsx eax, al
        mov qword[chest + 8 * eax], 0
        mov al, [itemsIndexes+1]
        movsx eax, al
        mov qword[chest + 8 * eax], 0
        leave
        ret

assembler:
        enter 0,0
        mov ax, [belt1+4+2] ;5678
        mov [final_product], ax
        mov ax, [belt2+2] ;aaaa
        mov [final_product+2], ax
        mov ax, [belt2] ;bbbb
        mov [final_product+4], ax
        mov ax, [belt1+2]
        mov [final_product+6], ax

        leave
        ret