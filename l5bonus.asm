extern printf

section .data
    num dq 12 ; works for upto 12, see l5bonustry.asm for different approach
    format db "%d",10, 0

section .text
    global main

main:
    mov rbx, 1 ; i = 0
    mov rax, 1 ; where factorial will be stored
    loop:
        cmp rbx, [num]
        jg exit
        mul rbx ; n = n * i
        inc rbx
        jmp loop
        
    exit:
    mov r14, rax
    xor rax, rax
    mov rdi, format
    mov rsi, r14
    call printf
        
    mov rax, 60
    syscall