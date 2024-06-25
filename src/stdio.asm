section .data
    newline db 0x0A



section .text
    global _stdin
    global _stdout


_stdin:
    push rbp
    mov rbp, rsp

    mov rax, 0
    mov rdi, 0
    syscall
    
    leave
    ret


_stdout:
    mov rax, 1
    mov rdi, 1
    syscall

    ret


_stdouLn:
    mov rax, 1
    mov rdi, 1
    syscall

    mov rsi, newline
    mov rdx, 1
    syscall

    ret 