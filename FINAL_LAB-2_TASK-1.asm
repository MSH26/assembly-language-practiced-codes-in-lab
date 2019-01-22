.MODEL SMALL
.STACK 100H
.DATA
    
    a DW '?'
    
    st1 DB 'INPUT : $'
    st2 DB 'OUTPUT : $'
    
    nl DB 0DH,0AH,'$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CL,0D
    MOV CH,0D  
    
    MOV AH,9
    LEA DX,st1
    INT 21H
    
INPUT:
    
    MOV AH,1
    INT 21H   
    
    MOV BX,AX
    
    CMP BX,013FH
    JE NEWLINE
    
    PUSH BX
    
    INC CH   
    
    CMP CL,0D
    JZ INPUT 
    
NEWLINE:
    
    MOV AH,9
    LEA DX,nl
    INT 21H 
    
    MOV AH,9
    LEA DX,st2
    INT 21H   
    
    JMP OUTPUT
    
OUTPUT: 
    
    MOV CL,CH
    
    MOV AH,2
    
    POP BX 
    
    DEC CH
    
    MOV DX,BX
    INT 21H  
    
    CMP CL,1D
    JNE OUTPUT    
    
EXIT:
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    