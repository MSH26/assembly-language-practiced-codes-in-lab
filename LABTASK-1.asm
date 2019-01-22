.MODEL SMALL
.STACK 100H
.DATA

    a DB 0
    b DB 0
    c DB ?
    l1 DB 0
    l2 DB 0
    
    st1 DB 'INPUT:$'
    st2 DB 'No of 1s:$'
    st3 DB 'No of 0s:$'
    
    nl DB 0DH,0AH,'$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV CH,48D
    MOV BL,48D
    
INPUT:
    
    MOV CL,l2
    CMP CL,5
    JE EXIT
    
    MOV AH,9
    LEA DX,st1
    INT 21H
    
    MOV AH,1 
    INT 21H
    
    MOV BH,AL
    MOV c,BH 
    
    INC CL
    MOV l2,CL

OOP:
    
    MOV CL,l1
    CMP CL,8
    JE OUTPUT
    
    SHL BH,1
    JC OOP2
    JNC OOP1
    
    
OOP1:
    ;MOV BL,a
    ;ADD BL,1
    ;MOV a,BL 
    INC BL
    
    MOV CL,l1
    INC CL
    MOV l1,CL
    
    JMP OOP 
    
OOP2:
    ;MOV BL,b
    ;ADD BL,1
    ;MOV b,BL
    INC CH
    
    MOV CL,l1
    INC CL
    MOV l1,CL
    
    JMP OOP
    
OUTPUT:
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    MOV AH,9
    LEA DX,st2 
    INT 21H
    
    MOV AH,2
    MOV DL,BL 
    INT 21H 
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    MOV AH,9
    LEA DX,st3 
    INT 21H
    
    MOV AH,2
    MOV DL,CH 
    INT 21H 
    
    MOV AH,9
    LEA DX,nl
    INT 21H  
    
    JMP INPUT
    
EXIT:
    
    MOV AH,4CH
    INT 21H 
    
    MAIN ENDP
END MAIN