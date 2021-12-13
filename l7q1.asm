extern printf

section .data
    str1 db "hello world", 0
    str2 db "hello world", 0
    format db "%d", 10, 0

section .text
    global main

main:
    mov rsi, str1
    mov rdi, str2
    xor rdx, rdx

loop:
    mov al, [rsi + rdx] ; store 1 byte from str1
    mov bl, [rdi + rdx] ; store 1 byte from str2
    inc rdx
    cmp al, bl ; compare two current characters
    jg greater ; if greater
    jl lesser ; if lesser
    cmp al, 0 ; check if string is complete
    je equal
    jmp loop

greater:
    mov r10, 1
    jmp exit

lesser:
    mov r10, -1
    jmp exit

equal:
    mov r10, 0
    jmp exit

exit:
    mov rdi, format
    mov rsi, r10
    xor rax, rax
    call printf


    mov rax, 60
    syscall


; nasm l7q1.asm -f elf64
; gcc l7q1.o -no-pie -m64 -o l7q1.out
; ./l7q1.out
