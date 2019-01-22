.MODEL SMALL
.STACK 100H
.DATA
    
    st0 DB 'ENTER AN ALGEBRIC EXPRESSION:$'
    st1 DB 'TOO MANY RIGHT BRACKETS.BEGIN AGAIN!$'
    st2 DB 'TOO MANY LEFT BRACKETS.BEGIN AGAIN!$' 
    st3 DB 'TYPE Y IF YOU WANT TO CONTINUE : $' 
    st4 DB 'EXPRESSION IS CORRECT$'
    st5 DB 'EXPRESSION IS NOT CORRECT$'
    
    nl DB 0DH,0AH,'$'
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   
    
    MOV CL,40H

START:    
    MOV AH,9
    ;LEA DX,nl
    ;INT 21H
    LEA DX,st0
    INT 21H      
    
INPUT:
    MOV AH,1
    INT 21H   
    
    CMP AX,010DH
    JE POP_CUR
    
    CMP AX,0128H
    JE OP1
    
    CMP AX,015BH
    JE OP1  
    
    CMP AX,017BH
    JE OP1
    
    CMP AX,0129H
    JE FIRTSBRAC
    
    CMP AX,015DH
    JE SEC_OR_THIR       
    
    CMP AX,017DH
    JE SEC_OR_THIR   
    
    JMP INPUT

OP1:    
    PUSH AX  
    INC CL
    JMP INPUT 
    
FIRTSBRAC:
    SUB AX,0001H
    JMP OP2
    
SEC_OR_THIR:
    SUB AX,0002H
    JMP OP2
    
OP2:
    CMP CL,40H
    JE POP
    POP BX  
    DEC CL
    
    CMP BX,4E45H
    JE COMMENTFF          
    
    CMP BX,AX 
    JNE COMMENTF
    JE INPUT 

COMMENTFF:
    MOV AH,9
    LEA DX,st1
    INT 21H   
    
    JMP DICISSION
    
COMMENTF:
    MOV AH,9
    LEA DX,st2
    INT 21H
    
    JMP DICISSION
    
COMMENTT:
    MOV AH,9    
    LEA DX,nl
    INT 21H
    
    LEA DX,st4
    INT 21H  
    
    JMP DICISSION
    
DICISSION:
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    LEA DX,st3
    INT 21H   
    
    MOV AH,1
    INT 21H
    
    CMP AL,59H
    JE NEWLINE
    JNE EXIT 
    

POP_CUR:
    POP BX
    
    CMP BX,4E45H
    JE COMMENTT
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    LEA DX,st5
    INT 21H   
    
    JMP DICISSION
                    
POP:
    MOV AH,9
    LEA DX,nl
    INT 21H
    LEA DX,st5
    INT 21H   
    
    JMP DICISSION
    
NEWLINE:
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    JMP START
    
    
EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN