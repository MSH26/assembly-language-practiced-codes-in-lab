.MODEL SMALL
.STACK 100H
.DATA 
    
    msg1 DB 'INPUT:$'    
    msg2 DB 'OUTPUT: $'
    
    nl   DB 0DH,0AH,'$'

.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 

    MOV AH,9
    LEA DX,msg1
    INT 21H    
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL 
    
    MOV AH,9
    LEA DX,nl
    INT 21H 
    
    MOV AH,9
    LEA DX,msg2
    INT 21H
    
    MOV AH,2
    MOV DL,49
    INT 21H
    
    SUB BL,17 
    
    MOV DL,BL
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN