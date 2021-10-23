extern printf

section .data
    num dd 20
    format db "%08x", 0 ; print in hex, 32 bits at a time
    newline db 10, 0
    result1 dd 0
    result2 dd 0

section .text
    global main

main:
    mov ebx, 1 ; i = 0
    mov eax, 1 ; where factorial will be stored
    xor rdx, rdx
    loop:
        cmp ebx, [num] ; loop break condition
        jg exit
        mov r12d, edx ; save high bits from previous multiplication
        mul ebx ; multiply low bits first
        mov [result1], edx
        mov [result2], eax ; store result of low bits multiplication in memory
        mov eax, r12d ; get the high bits from previous multiplication
        mul ebx ; multiply high bits
        mov edx, eax
        add edx, [result1] ; set high bits result for next multiplication
        mov eax, [result2] ; set low bits result for next multiplication
    cont:
        inc ebx
        jmp loop
        
    exit:
    mov r13d, eax
    xor rax, rax
    mov rdi, format
    mov rsi, rdx
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