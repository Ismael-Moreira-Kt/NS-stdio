section .data
    msg db 'Enter input: ', 0





section .bss
    input1 resb 100



    

section .text
    extern _stdoutLn
    extern _stdout
    extern _stdin
    global _start

_start:
    mov rsi, msg
    call _stdout

    lea rdi, [input1]
    call _stdin

    mov rsi, input1
    call _stdoutLn

    mov rax, 60
    xor rdi, rdi
    syscall
