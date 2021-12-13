CODE SEGMENT
ASSUME CS:CODE
START
MOV AX,1000H
MOV DS,AX
MOV AX,8000H
MOV ES,AX
MOV SI,2000H
MOV DI,3000H
MOV AX,6000H
MOV SS,AX
MOV SP,0000H
A_ROWS EQU 02H
A_COLUMNS EQU 03H
B_ROWS EQU 03H
B_COLUMNS EQU 02H

MOV AL, A_ROWS
MOV BL,B_COLUMNS
MUL BL

 
        MOV CX,AX;
        MOV BP,4000H
LOOP2:  MOV W.ES:[BP],00000H
        INC BP
        INC BP     
        LOOP LOOP2    
    
       MOV BP,4000H
       MOV BX,0000H 
       MOV DX,0000H
       MOV AL,A_ROWS
       CBW
       MOV SP,AX
L3:    MOV CH,B_COLUMNS
L2:    MOV AL,B_COLUMNS
       SUB AL,CH
       CBW
       ADD DI,AX
       MOV CL,A_COLUMNS; NUMBER OF COLUMNS IN MTRIX A
L1:    MOV AL, DS:[SI+ BX]
       ADD DI,DX
       IMUL DS:[DI]
       ADD W.ES:[BP],AX      
       INC BX
       MOV AL,B_COLUMNS
       CBW
       MOV DX,AX
       MOV AH,00H
       DEC CL
       JNZ L1
       INC BP
       INC BP
       MOV BX,0000H
       MOV DI,3000H
       MOV DX,0000H
       DEC CH
       JNZ L2
       MOV AL,A_COLUMNS
       CBW
       ADD SI,AX    
       DEC SP
       JNZ L3
      
      HLT
CODE ENDS
END START