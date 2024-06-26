section .data
    newline db 0x0A





section .text
    global _stdin
    global _stdout
    global _stdoutLn


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



_stdout:
    mov rdi, rsi
    call _strLen
    mov rdx, rax

    mov rax, 1
    mov rdi, 1
    syscall

    ret



_stdoutLn:
    push rdi
    call _strLen
    pop rsi
    mov rdx, rax

    mov eax, 1
    mov edi, 1
    syscall

    mov eax, 1
    mov edi, 1
    mov rsi, newline

    mov rdx, 1
    syscall
    
    ret



_strLen:
    xor rcx, rcx
    not rcx

    xor al, al
    repne scasb
    
    not rcx
    dec rcx
    
    mov rax, rcx

    ret