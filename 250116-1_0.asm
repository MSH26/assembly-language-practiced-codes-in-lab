.MODEL SMALL
.STACK 100H 
.DATA
.CODE   

MAIN PROC
    
;NAME: OPCODE OPERAND(S) COMMENT
    ;MOV AH,2
    ;MOV DL,'$'
    ;INT 21H  
    
    MOV AH,1
    INT 21H  
    MOV BH,AL
    INT 21H  
    MOV CL,AL
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,CL
    INT 21H
    
    

    MAIN ENDP
END MAIN 