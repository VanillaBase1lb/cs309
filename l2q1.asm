extern printf

section .data
; openingMsg db 'Sum of the 5 numbers in the program is:'
; len_openingMsg equ $-openingMsg
string db "The sum is %d", 10, 0
num1 dd 1
num2 dd 2
num3 dd 3
num4 dd 4
num5 dd 5

section .text
    global main
    
main:

    mov rdi, string ; arg1(string)
    mov rsi, [num1] ; arg2
    add rsi, [num2]
    add rsi, [num3]
    add rsi, [num4]
    add rsi, [num5]
    xor rax, rax ; set rax=0 necessary for printf
    call printf
    
    mov rax, 60 ; exit
    syscall
    
;nasm l2q1.asm -f elf64
;gcc l2q1.o -m64 -no-pie
;./a.out