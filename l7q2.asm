extern printf

section .data
    str1 db "racecar", 0
    len1 equ $ - str1 - 1
    format db "%s", 10, 0

section .text
    global main

main:
    mov r9, len1
    shr r9, 1

    xor rcx, rcx
    mov r13, str1 + len1 - 1
    loop:
        cmp rcx, r9
        je palindrome
        mov al, [ str1 + rcx ] ; left byte to compare
        mov bl, [ r13 ] ; right byte to compare
        cmp al, bl ; compare the bytes
        jne exit ; if different, number is not palindrome

        dec r13
        inc rcx
        jmp loop
    
palindrome:
    mov rdi, format
    mov rsi, str1
    xor rax, rax
    call printf

exit:
    mov rax, 60
    syscall


; nasm l7q2.asm -f elf64
; gcc l7q2.o -no-pie -m64 -o l7q2.out
; ./l7q2.out
