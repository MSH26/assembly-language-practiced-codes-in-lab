.MODEL SMALL
.STACK 100H
.DATA
    
    v1 DB ?
    v2 DB ?
    
    m1 DB 'ENTER ANYTHING:$'
    m2 DB 'PROGRAM ENDS HERE.$'

    nl DB 0DH,0AH,'$'
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
INPUT:    
    MOV AH,9 
    LEA DX,m1
    INT 21H  
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL 
    
    CMP BL,'T'
    JE EXIT
    
    MOV AH,2
    MOV DL,32D
    INT 21H
    
    ADD BL,1
    
    MOV AH,2
    MOV DL,BL
    INT 21H 
    
    MOV AH,9 
    LEA DX,nl
    INT 21H
    
    JMP INPUT 
    
EXIT:
    MOV AH,9 
    LEA DX,nl
    INT 21H
    
    MOV AH,9 
    LEA DX,m2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN