extern printf

section .data
    arr dq -7Fh, -01h, 32h, -0h, 11h, 23h, -72h, -99h, -7Fh, 0h, 0h, 2h, 1h, 9h, 3h, 12h, 55h, -24h, 0h, 00h
    format db "%d",10,0
    negatives dq 0 ; number of negative numbers
    positives dq 0
    zeroes dq 0

section .text
    global main

; r12, r13 and r14 used because r8, r9 and other registers are destroyed on printf function call

main:
    mov r14, arr ; r14 holds address of arr array
    mov r12, 20 ; counter

loop1:
    mov r13, [r14] ; value at r14
    rcl r13, 1 ; rotate left by 1 because MSB will be 1 if the value is negative
    jc negative ; jump in carry bit is set i.e. MSB was 1
    mov r13, [r14]
    xor r13, 0 ; again check if number is 0
    jz zero
    jmp positive

cont:
    add r14, 8 ; move array pointer 8 bytes forward because quadword
    dec r12
    jnz loop1 ; loop as long as counter not 0

    mov rdi, format
    mov rsi, [negatives]
    xor rax, rax
    call printf

    mov rdi, format
    mov rsi, [positives]
    xor rax, rax
    call printf

    mov rdi, format
    mov rsi, [zeroes]
    xor rax, rax
    call printf

    mov rax, 60
    mov rbx, 0
    syscall
    
negative:
    mov r8, [negatives]
    inc r8
    mov qword [negatives], r8
    jmp cont
    
positive:
    mov r8, [positives]
    inc r8
    mov qword [positives], r8
    jmp cont

zero:
    mov r8, [zeroes]
    inc r8
    mov qword [zeroes], r8
    jmp cont