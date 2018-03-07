 DATA SEGMENT
 BUF DB 10,?,10 DUP(?),'$'
 DATA ENDS
 CODE SEGMENT 
 ASSUME CS:CODE,DS:DATA
 START:     
 MOV AX,DATA       
 MOV DS,AX       
 LEA BX,BUF       
 MOV DX,BX      
 MOV AH,0AH    
 INT 21H
 CMP 3[BUF],24H
 JZ ANOTHER
 CMP 4[BUF],24H
 JZ ANOTHER
 CMP 5[BUF],'$'
 JNZ ANOTHER
 ADD BX,3
 MOV AH,09H
 INT 21H   
 JMP OVER
 ANOTHER:  
 MOV DL,3[BUF]     
 MOV AH,02H     
 INT 21H       
 mov dl,0ah    
 mov ah,02h      
 int 21h     
 mov dl,0dh   
 mov ah ,02h        
 int 21h       
 MOV DL,4[BUF]   
 MOV AH,02H      
 INT 21H
 OVER:        
 MOV AX,4C00H      
 INT 21H
 CODE ENDS 
 END START
 