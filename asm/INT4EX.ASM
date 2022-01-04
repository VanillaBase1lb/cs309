ASSUME DS:DATA, CS:CODE
DATA SEGMENT
STR1 db "Overflow Error", 0AH, 0DH, '$';
DATA ENDS
CODE SEGMENT
START:
                MOV AX, DATA
                MOV DS, AX
                XOR AX, AX
                MOV ES, AX
        
                MOV BX, OFFSET OVERFLOW
                MOV ES:[10H], BX
                MOV ES:[12H], CS
        

                MOV AX, 7FFFH   ; 7FFF=0111 1111 1111 1111
                ADD AX, 0000H
                JNO L1 
        INTO
    L1: MOV AH, 4CH
        INT 21H

OVERFLOW:     
        LEA DX, STR1
        MOV AH, 09H
        INT 21H
        IRET
CODE ENDS
END START


