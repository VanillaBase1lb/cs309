extern printf

section .data
    arr dq -7Fh, -01h, 32h, -0h, 11h, 23h, -72h, -99h, -7Fh, 0h, 0h, 2h, 1h, 9h, 3h, 12h
    oddstr db "01 ", 0
    evenstr db "00 ", 0
    newline db 10, 0 ; required to flush the buffer and print something

section .text
    global main

; r12, r13 and r14 used because r8, r9 and other registers are destroyed on printf function call

main:
    mov r14, arr ; r14 holds address of arr array
    mov r12, 16 ; counter

loop1:
    mov r13, [r14] ; value at r14
    add r13, 0 ; perform some artihmetic operation to set flag register
    jpo odd ; if parity bit = 0 i.e. odd number of 1s in least significant byte, then jmp
    jmp even

cont:
    add r14, 8 ; move array pointer 8 bytes forward because quadword
    dec r12
    jnz loop1 ; loop as long as counter not 0
    
    mov rdi, newline
    xor rax, rax
    call printf

    mov rax, 60
    mov rbx, 0
    syscall
    
odd:
    mov rdi, oddstr
    xor rax, rax
    call printf
    jmp cont
    
even:
    mov rdi, evenstr
    xor rax, rax
    call printf
    jmp cont