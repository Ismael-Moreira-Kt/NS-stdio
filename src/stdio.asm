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