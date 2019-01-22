.MODEL SMALL
.STACK 100H 
.DATA
.CODE   

MAIN PROC
    
;NAME: OPCODE OPERAND(S) COMMENT
    MOV AH,2 
    
    MOV DL,'N'
    INT 21H   
    MOV DL,'a'
    INT 21H 
    MOV DL,'m'
    INT 21H 
    MOV DL,'e'
    INT 21H 
    MOV DL,':'
    INT 21H 
    MOV DL,'S'
    INT 21H 
    MOV DL,'a'
    INT 21H 
    MOV DL,'k'
    INT 21H 
    MOV DL,'i'
    INT 21H 
    MOV DL,'b'
    INT 21H 
    MOV DL,'.'
    INT 21H
     
    MOV DL,13
    INT 21H 
    MOV DL,10
    INT 21H  
    
    MOV DL,'I'
    INT 21H 
    MOV DL,'D'
    INT 21H 
    MOV DL,':'
    INT 21H 
    MOV DL,'1'
    INT 21H 
    MOV DL,'5'
    INT 21H 
    MOV DL,'-'
    INT 21H 
    MOV DL,'2'
    INT 21H   
    MOV DL,'8'
    INT 21H 
    MOV DL,'7'
    INT 21H 
    MOV DL,'7'
    INT 21H 
    MOV DL,'9'
    INT 21H 
    MOV DL,'-'
    INT 21H 
    MOV DL,'1'
    INT 21H 
    

    MAIN ENDP
END MAIN 