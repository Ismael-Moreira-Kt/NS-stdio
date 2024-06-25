section .text
    global _stdin



_stdin:
    push rbp
    mov rbp, rsp

    mov rax, 0
    mov rdi, 0
    syscall
    
    leave
    ret