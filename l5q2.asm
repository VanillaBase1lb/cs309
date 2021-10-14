; for (i = 0; i < n-1; i++)
;     {
;         min_idx = i;
;         for (j = i+1; j < n; j++)
;         if (arr[j] < arr[min_idx])
;             min_idx = j;
;         swap(&arr[min_idx], &arr[i]);
;     }



extern printf

%define n 15 ; number of numbers (> 10)

section .data
    arr dq 2h, 1h, 9h, 12h, 51h, 125h, 6h, 0h, 2153h, 6143h, 2h, 1h, 43h, 325h, 9h
    format db "%d ", 0
    newline db 10, 0
    openingMsg db "Elements in ascending order using selection sort:", 10, 0

section .text
    global main
    
main:
    xor rax, rax ; i = 0
    xor r10, r10 ; min value index

iloop:
    cmp rax, n
    je exit ; end when i == n
    mov r10, rax ; min index = i
    inc rax
    mov rcx, rax ; j = i + 1
    dec rax
    jloop:
        cmp rcx, n
        je jloopend ; end when j == n
        mov rdx, [arr + rcx * 8] ; rdx = arr[j]
        mov rbx, [arr + r10 * 8] ; rbx = arr[min_index]
        inc rcx
        cmp rdx, rbx
        jge jloop ; if condition
        dec rcx
        mov r10, rcx ; min_index = j
        inc rcx ; j++
        jmp jloop
    jloopend:
    
    mov r14, [arr + r10 * 8] ; arr[min_index]
    mov r15, [arr + rax * 8] ; arr[i]
    mov [arr + r10 * 8], r15 ; arr[min_index] = arr[i]
    mov [arr + rax * 8], r14 ; arr[i] = arr[min_index]
    inc rax ; i++
    jmp iloop

exit:
    xor r13, r13 ; loop counter
    mov r14, arr
    
    xor rax, rax
    mov rdi, openingMsg
    call printf

printloop:
    xor rax, rax
    mov rdi, format
    mov rsi, [r14]
    call printf
    add r14, 8
    inc r13
    cmp r13, n
    jne printloop
    
    xor rax, rax
    mov rdi, newline
    call printf

    mov rax, 60
    syscall