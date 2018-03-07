data segment
	str1 db 'Please input a string(length<9):$' 
	str2 db 'Please input the index of the char to display:$'
	
	str3 db 20,?,20 dup('$')
data ends

code segment
assume ds:data,cs:code
start:	mov ax,data
	mov ds,ax
	
again1:	lea dx,str1
	mov ah,09
	int 21h
	
	lea dx,str3
	mov ah,0ah
	int 21h

	mov ah,02
	mov dl,10
	int 21h
	mov dl,13
	int 21h
	
	cmp str3+1,8
	ja again1
	
	
	
again2:	lea dx,str2
	mov ah,09
	int 21h

	mov ah,01
	int 21h
	sub al,30h
	mov cl,al	
	
	mov ah,02
	mov dl,10
	int 21h
	mov dl,13
	int 21h
	
	mov al,str3+1
	cmp cl,al
	jae again2
	mov bl,cl
	mov bh,0
	mov al,str3[bx+2]
	
	mov dl,al
	mov ah,02
	int 21h
	
	



mov ah,01h
int 21h

XOR CX,CX


MOV CL,str3[1]	
MOV BX,-1
MOV DL,0

l3:  	inc bx
	cmp al,str3[bx+2]
	jnz l4
	inc dl
l4:
	LOOP l3

ADD DL,30H
MOV CL,DL

MOV DL,0AH		
MOV AH,2
INT 21H
MOV DL,0DH
MOV AH,2
INT 21H

MOV DL,CL
MOV AH,2
INT 21H


	 
exit:	mov ah,4ch
	int 21h
code ends
end start
