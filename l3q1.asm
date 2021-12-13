extern printf

section .data
    arr db 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h, 9h, 21h
    txt db "%d", 10, 0

section .text
    global main
 
; r10, r9 and other scratch registers can be used because there is only 1 function call
; towards the end of the program

main:
    mov rbx, arr ; pointer to array
    xor r8, r8 ; even counter = 0
    mov r9, 0

loop:
    movzx r10, byte [rbx] ; move 1 bye from array to r10 register
    and r10, 0b1 ; and with binary 1
    jz if_even
cont:
    inc rbx
    inc r9
    cmp r9, 10
    jle loop

    mov rdi, txt
    mov rsi, r8
    xor rax, rax
    call printf
    
    mov rax, 60
    syscall
    
if_even:
    inc r8
    jmp cont


; nasm l3q1.asm -f elf64
; gcc l3q1.o -m -no-pie
; ./a.out
