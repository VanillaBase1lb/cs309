ASSUME DS:DATA, CS:CODE
DATA SEGMENT
STR1 db "Divide by zero error", 0AH, 0DH, '$';
DATA ENDS
CODE SEGMENT
START:
                MOV AX, DATA
                MOV DS, AX
                XOR AX, AX  ; AX=0000H
                MOV ES, AX  ; ES=0000H
                                       ;
                MOV BX, OFFSET DIVZERO ;
                MOV ES:[00], BX    ; INT 0 Base: 0000:0000H
                MOV ES:[02], CS    ; 
                MOV AL, 87H
                MOV CL, 00H
                DIV CL
       
        MOV AH, 4CH
        INT 21H
DIVZERO:        POP BP
                ADD BP, 02H
                PUSH BP
                LEA DX, STR1
         MOV AH, 09H
         INT 21H
         IRET
CODE ENDS
END START


