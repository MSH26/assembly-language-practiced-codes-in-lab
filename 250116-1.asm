.MODEL SMALL
.STACK 100H 
.DATA
.CODE   

MAIN PROC
    
;NAME: OPCODE OPERAND(S) COMMENT
    MOV AH,2
    MOV DL,'$'
    INT 21H  

    MAIN ENDP
END MAIN 