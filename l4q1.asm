extern printf

section .data:
    array1 dq 1,2,3,4,5,6,7,8,9
    array2 dq 10,11,12,13,14,15,16,17,18
    result db '%d ',10,0

section .text
    global main

main:
    mov r15, array1
    mov r14, array2
    mov rbx, 0

    loop:
    cmp rbx, 9
    jge exit
    inc rbx
    mov r13, [r15]
    mov r12, [r14]
    add r12, r13
    add r15, 8
    add r14, 8

    print:
    mov rdi, result
    mov rsi, r12
    xor rax, rax
    call printf
    jmp loop

    exit:
    mov rax, 60
    syscall
