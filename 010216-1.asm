.MODEL SMALL
.STACK 100H
.DATA 
    
    ;VARIABLE DECLARATION
    
    a DB 101
    b DB ?   
    
    ;STRING DECLARATION
    
    c DB 'COA CLASS$'

.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV b,AL
    ;MOV CL,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,2
    ;MOV DL,CL
    MOV DL,b
    INT 21H  
    
    
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    
    MOV DL,a
    INT 21H    
    
    
    
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;LOAD EFFECTIVE ADDRESS =16bit,DX
    
    MOV AH,9
    LEA DX,c   
    INT 21H
    
    
    
    MOV AH,4CH
    INT 21H 
    

    END MAIN
MAIN ENDP