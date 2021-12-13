extern printf

section .data:
    array1 dq 1,2,3,4,5,6,7,8,9
    array2 dq 10,11,12,13,14,15,16,17,18
    result db '%d ',10,0

section .text
    global main

main:
    outerloop1:
    mov rbx, 8
    mov rbp, 0
    mov r10, 0
    mov r11, 0
    mov r12, 0
    mov r15, array1
    mov r14, array2

    loop1:
    cmp r11, 3
    jge print1
    inc r11
    inc r10
    mov rax, [r14]
    mov r13, [r15]
    mul r13
    add r12, rax
    add r14, 24
    add r15, 8
    cmp r10, 3
    jge m1_reset1
    jmp loop1

    m1_reset1:
    mov r15, array1
    mov r14, array2
    add r14, rbx
    add rbx, 8
    jmp loop1

    loop2:
    mov r11, 0
    mov r10, 0
    mov r12, 0
    inc rbp
    cmp rbp, 3
    jge outerloop2
    jmp loop1
    
    print1:
    mov rdi, result
    mov rsi, r12
    xor rax, rax
    call printf
    jmp loop2


    outerloop2:
    mov rbx, 8
    mov rbp, 0
    mov r10, 0
    mov r11, 0
    mov r12, 0
    mov r15, array1
    add r15, 24
    mov r14, array2

    loop3:
    cmp r11, 3
    jge print2
    inc r11
    inc r10
    mov rax, [r14]
    mov r13, [r15]
    mul r13
    add r12, rax
    add r14, 24
    add r15, 8
    cmp r10, 3
    jge m1_reset2
    jmp loop3

    m1_reset2:
    mov r15, array1
    mov r14, array2
    add r15, 24
    add r14, rbx
    add rbx, 8
    jmp loop3

    loop4:
    mov r11, 0
    mov r10, 0
    mov r12, 0
    inc rbp
    cmp rbp, 3
    jge outerloop3
    jmp loop3
    
    print2:
    mov rdi, result
    mov rsi, r12
    xor rax, rax
    call printf
    jmp loop4


    outerloop3:
    mov rbx, 8
    mov rbp, 0
    mov r10, 0
    mov r11, 0
    mov r12, 0
    mov r15, array1
    add r15, 48
    mov r14, array2
    
    loop5:
    cmp r11, 3
    jge print3
    inc r11
    inc r10
    mov rax, [r14]
    mov r13, [r15]
    mul r13
    add r12, rax
    add r14, 24
    add r15, 8
    cmp r10, 3
    jge m1_reset3
    jmp loop5

    m1_reset3:
    mov r15, array1
    mov r14, array2
    add r15, 48
    add r14, rbx
    add rbx, 8
    jmp loop5

    loop6:
    mov r11, 0
    mov r10, 0
    mov r12, 0
    inc rbp
    cmp rbp, 3
    jge exit
    jmp loop5
    
    print3:
    mov rdi, result
    mov rsi, r12
    xor rax, rax
    call printf
    jmp loop6

    exit:
    mov rax, 60
    syscall
