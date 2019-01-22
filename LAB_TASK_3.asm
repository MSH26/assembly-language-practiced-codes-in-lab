.MODEL SMALL
.STACK 100H
.DATA
       
    st1 DB 'ENTER A CHAR:$'
    st2 DB 'RESULT: $' 
    
.CODE 

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,st1 
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BH,AL
    MOV BL,AL
             
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
             
    MOV AH,9
    LEA DX,st2
    INT 21H
    
    SUB BH,1 
    
    ADD BL,1  
    
    MOV AH,2
    MOV DL,BH
    INT 21H 
    MOV DL,','
    INT 21H
    MOV DL,BL
    INT 21H 
    
    MOV AH,4CH
    INT 21H
    
    END MAIN
MAIN ENDP