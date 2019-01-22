.MODEL SMALL
.STACK 100H
.DATA
    
    st0 DB 'Input:$'
    st1 DB 'Starting again...$'
    st2 DB 'Program teminated!!!$'
    
    nl DB 0DH,0AH,'$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
INPUT:
    
    MOV AH,9
    LEA DX,st0
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BH,AL
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
FIRST_TEST: 
    
    MOV AH,9
    LEA DX,st0
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    CMP BL,BH
    JNE SIGN
    
SECOND_TEST:    
    
    MOV AH,9
    LEA DX,st0
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    CMP BL,BH
    JE EXIT        
    JNE SIGN
    
SIGN:

    MOV AH,9
    LEA DX,st1
    INT 21H
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    JMP INPUT
    
EXIT:

    MOV AH,9
    LEA DX,st2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN