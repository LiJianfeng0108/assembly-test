DATA  SEGMENT
  list dw 5,1,3,8,9,18
  a dw 6 
DATA  ENDS
CODE  SEGMENT
  ASSUME  CS:CODE,DS:DATA
START:  MOV  AX , DATA
        MOV  DS , AX

	mov ax,a
	mov cx,list
	mov bx,list
	add bx,bx;bx=10

again:	mov dx,list[bx]
	cmp ax,dx
	ja end1
	mov list[bx+2],dx
	sub bx,2
	loop again

end1:	mov list[bx+2],ax
	add list,1	

        MOV  AX , 4C00H
        INT  21H
CODE  ENDS
  END  START

