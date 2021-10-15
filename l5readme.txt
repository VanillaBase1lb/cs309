1:
    Addition of 2 n byte numbers.
    Done by adding each byte from 2 arrays and storing the result in third.
    Performed backwards to account for carry bits
    
2:
    Direct implementation of selection sort in C
    

nasm -f elf64 l5q1.c
gcc l5q1.o -no-pie -m64
./a.out