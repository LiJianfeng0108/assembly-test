DATA SEGMENT 
B1 DB 0FEH          
 X DB ?              
 Y DB ?               
 DATA ENDS             
 CODE SEGMENT             
 ASSUME DS:DATA,CS:CODE 
 START: MOV AX,DATA          
 MOV DS,AX          
 MOV BL,B1        
 MOV AL,BL        
 AND AL,0FH     
 MOV X,AL       
 AND BL,0F0H    
 MOV CL,4 
 SHR BL,CL  
 MOV Y,BL   
 MOV AX,4C00H 
 INT 21H         
 CODE ENDS 
 END START 