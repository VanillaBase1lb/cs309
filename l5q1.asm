extern printf

%define numofbytes 15 ; number of bytes in the numbers (> 10)

section .data
    ; define 2 numbers to be added
    num1 db 1h, 2h, 87h, 1h, 87h, 1h, 2h, 87h, 1h, 87h, 1h, 87h, 1h, 2h, 87h
    num2 db 3h, 6h, 87h, 1h, 87h, 3h, 6h, 87h, 10h, 87h, 1h, 87h, 3h, 6h, 87h
    result1 times numofbytes db 0 ; result will be stored in this array of data
    format db "%d ", 0
    newline db 10, 0 ; newline required to flush the buffer
    openingMsg db "Contents of each byte in decimal format:", 10, 0

section .text
    global main
    
main:
    xor r9, r9 ; carry bit boolean variable. scratch register can be used because printf is used at end
    mov rbx, numofbytes - 1 ; counter variable
    mov r14, num1 + numofbytes - 1 ; pointer to last byte of num1
    mov r15, num2 + numofbytes - 1

; addition starts from least significant byte because carry bit has to be forwarded
loop:
    cmp rbx, 0
    jl exit
    mov r12b, byte [r14] ; copy from pointer to r12b(1 byte only)
    mov r13b, byte [r15]
    cmp r9, 0
    jne ifcarry ; if carry bit(r9) = 1, then jump
    add r12b, r13b ; add the bytes
    jc setcarry ; if the addition results in carry, then jump
    mov r9, 0 ; set back carry variable to 0
cont:
    mov [result1 + rbx], r12b ; store the result of addition in memory
    dec r14 ; decrement pointer
    dec r15
    dec rbx
    jmp loop

ifcarry:
    inc r12b ; since carry variable is 1, add 1 to result
    add r12b, r13b
    jc setcarry
    mov r9, 0
    jmp cont

setcarry:
    mov r9, 1 ; since carry is 1
    jmp cont

exit:
    xor rax, rax
    mov rdi, openingMsg
    call printf

    xor r13, r13 ; counter variable. Can be reused since calculation part is over
    mov r14, result1 ; pointer to result array

; print each byte in the result array in decimal format
printloop:
    mov rdi, format
    movzx rsi, byte [r14] ; mov lowest byte and extend previous bytes with 0(unsigned)
    xor rax, rax
    call printf
    inc r13
    inc r14
    cmp r13, numofbytes
    jne printloop
    
    xor rax, rax
    mov rdi, newline
    call printf

    mov rax, 60
    syscall