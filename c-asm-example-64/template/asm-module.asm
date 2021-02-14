	bits 64

	section .data
        section .text

global fn
fn:
    enter 0, 0

    mov eax, 42
    
    leave
    ret