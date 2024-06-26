section .data
    hello db "Hello ", 0
    hello_len equ $ - hello
    world db "World!", 0
    world_len equ $ - world





section .text
    extern _stdout
    extern _stdoutLn
    global _start



_start:
    mov rsi, world 
    call _stdout

    mov rdi, hello
    call _stdoutLn

    mov rax, 60               
    xor rdi, rdi           
    syscall                