extern printf

section .data
string db "The product is %d", 10, 0
num1 dd 100
num2 dd -2
num3 dd 32

section .text
    global main
    
main:

    mov rdi, string ; arg1(string)
    mov rax, [num1] ; mul multiplies from rax
    mul dword [num2]
    mul dword [num3]
    mov rsi, rax ; arg2
    xor rax, rax ; set rax=0 necessary for printf
    call printf
    
    mov rax, 60 ; exit
    syscall
    
;nasm l2q2.asm -f elf64
;gcc l2q2.o -m64 -no-pie
;./a.out