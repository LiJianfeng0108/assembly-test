DATA  SEGMENT 
    X DD ?
    Y DD ?
    Z DW ?
    A DW ?
    B DW ?
DATA  ENDS
CODE SEGMENT
   ASSUME  CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        MOV AX,WORD PTR [X]
        MOV DX,WORD PTR [X+2]
        MOV CX,AX
        MOV BX,DX
	MOV AX,WORD PTR [Y]
	MOV DX,WORD PTR [Y+2]
        SUB AX,CX
        SBB DX,BX
        ADD AX,24
	ADC DX,0
        IDIV Z
        MOV A,AX
        MOV B,DX   
        MOV AX,4C00H
        INT 21H
CODE ENDS
END START
                                                                                                                                                                                                   