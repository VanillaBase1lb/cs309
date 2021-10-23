extern printf
extern scanf

section .data
format db '%d %d', 0
openingMsg db 'Enter x and n(>0) with a space in 1 + x + x^2 + ... + x^n', 10, 0
result1 db '%d', 10, 0

section .bss
x resb 4
n resb 4

section .text
    global main
    
main:

    mov rdi, openingMsg
    xor rax, rax
    call printf
    
    sub rsp, 8 ; https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI
                ;https://stackoverflow.com/questions/26889692/nasm-x86-64-scanf-segmentation-fault
    mov rdi, format
    mov rsi, x
    mov rdx, n
    xor rax, rax
    mov al, 0 ; no floating point args
    call scanf
    add rsp, 8 ; restore the alignment made earlier
    
    mov r8, 0 ; i=0
    mov r10, 0 ; sum=0
    sum_loop:
        cmp r8, [n]
        jg sum_exit ; exit if i>n
        mov r9, 1 ; j=0
        mov rax, 1 ; a=1
        pow_loop:
            cmp r9, r8
            jg pow_exit ; exit if j>n
            mul dword [x] ; a=a*x
            inc r9 ; j++
            jmp pow_loop
        pow_exit:
        add r10, rax ; sum=sum+a
        inc r8 ; i++
        jmp sum_loop
    sum_exit:
    
    mov rdi, result1
    mov rsi, r10
    xor rax, rax
    call printf

    mov rax, 60 ; exit
    syscall
    
;nasm l2q3.asm -f elf64
;gcc l2q3.o -m64 -no-pie
;./a.out