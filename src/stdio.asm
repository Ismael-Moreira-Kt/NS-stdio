section .data
    newline db 0x0A





section .text
    global _stdin



_stdin:
    push rbp
    mov rbp, rsp
    push rbx
    push rsi
    push rdi

    mov rbx, rdi
    mov rsi, rbx


.stdin_loop:
    mov rax, 0
    mov rdi, 0
    mov rdx, 1
    syscall

    cmp byte [rbx], 0x0A
    je .stdin_end

    inc rbx
    inc rsi
    jmp .stdin_loop


.stdin_end:
    mov byte [rbx], 0
    
    pop rdi
    pop rsi
    pop rbx
    
    mov rsp, rbp
    pop rbp

    ret     