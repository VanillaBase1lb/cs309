CODE SEGMENT
ASSUME CS:CODE
START:
        XOR AX,AX
        MOV BX,AX
        MOV CL,AL
        MOV CL,09H
        MOV SI,3000H
        MOV DI,4000H
        MOV BX,5000H
L1:     MOV AL,[SI]
        ADD AL,[DI]
        MOV [BX],AL
        INC SI
        INC DI
        INC BX
        LOOP L1
CODE ENDS
END START
