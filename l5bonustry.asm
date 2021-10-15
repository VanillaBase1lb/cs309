extern printf

section .data
    num dq 13
    format db "%016x", 0
    newline db 10, 0

section .text
    global main

main:
    mov rbx, 1 ; i = 0
    mov rax, 1 ; where factorial will be stored
    loop:
        cmp rbx, [num]
        jg exit
        mul rbx ; n = n * i
        ; this mul never returns the high bits either in rdx(as per documentation) or in rbx(the register being worked on)
        ; how to get high bits from a 64 bit mul instruction????
        ; ideally result of mul should be in rdx:rax but rdx is always 0
        ; jno nocarry
        mov r14, rdx
    cont:
        inc rbx
        jmp loop
        
    exit:
    mov r13, rax
    xor rax, rax
    mov rdi, format
    mov rsi, r14
    call printf
    
    xor rax, rax
    mov rdi, format
    mov rsi, r13
    call printf
    xor rax, rax
    mov rdi, newline
    call printf
        
    mov rax, 60
    syscall
    
    nocarry:
        mov r14, 0
        jmp cont