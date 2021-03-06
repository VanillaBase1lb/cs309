ASSUME DS:DATA, CS:CODE
DATA SEGMENT
STRAL db "AL=", '$'
STRAH db "AH=", '$'
STRBL db "BL=", '$'
STRBH db "BH=", '$'
STRCL db "CL=", '$'
STRCH db "CH=", '$'
STRDL db "DL=", '$'
STRDH db "DH=", '$'
STRNL db 0AH, '$'
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX
    XOR AX, AX
    MOV ES, AX

    MOV BX, OFFSET PRINTREGISTERS
    MOV ES:[04H], BX
    MOV ES:[06H], CS
    INT 1
    MOV AL, 5
    MOV BL, 5
    MOV CL, 5
    MOV DL, 5

    MOV AH, 5
    MOV BH, 5
    MOV CH, 5
    MOV DH, 5
    INT 1

    MOV AH, 4CH
    INT 21H

PRINTREGISTERS:     
    LEA DX, STRAL
    MOV AH, 09H
    INT 21H
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    LEA DX, STRAH
    MOV AH, 09H
    INT 21H
    MOV DL, AH
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    LEA DX, STRBL
    MOV AH, 09H
    INT 21H
    MOV DL, BL
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    LEA DX, STRBH
    MOV AH, 09H
    INT 21H
    MOV DL, BH
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    LEA DX, STRCL
    MOV AH, 09H
    INT 21H
    MOV DL, CL
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    LEA DX, STRCH
    MOV AH, 09H
    INT 21H
    MOV DL, CH
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    LEA DX, STRDL
    MOV AH, 09H
    INT 21H
    MOV DL, DL
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    LEA DX, STRDH
    MOV AH, 09H
    INT 21H
    MOV DL, DH
    MOV AH, 02H
    INT 21H
    LEA DX, STRNL
    MOV AH, 09H
    INT 21H

    IRET

CODE ENDS
END START
