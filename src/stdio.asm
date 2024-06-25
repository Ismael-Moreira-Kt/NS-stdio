section .bss
    buffer resb 256



section .text
    global _stdin


    _stdin:
        mov rax, 0
        mov rdi, 0
        mov rsi, buffer
        mov rdx, 255
        syscall

        ret