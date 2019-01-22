.MODEL SMALL
.STACK 100H
.DATA
    
    v1 DB ?
    v2 DB ?
    v3 DB ?
    v4 DB ?
    v5 DB ?
    
    m1 DB 'WANT TO RUN THE PROGRAM Y or N:$'
    m2 DB 'ENTER A LETTER(Max 5 letters):$' 
    m3 DB 'OUTPUT:$'
    m4 DB 'PROGRAM TERMINATED. BE PREPARE FOR THE MID TERM.$'
    nl DB 0DH,0AH,'$'
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV CL,0   
        
DICISSION:    
    MOV AH,9 
    LEA DX,m1
    INT 21H 
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL 
    
    MOV AH,9 
    LEA DX,nl
    INT 21H
    
    CMP BL,'Y'
    JE INPUT0
    CMP BL,'N'
    JE EXIT 

INPUT0:    
    MOV AH,9 
    LEA DX,m2
    INT 21H


INPUT:
    
    CMP CL,4 
    JG OUTPUT 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CMP BL,65 
    JGE LOOP1
    JL INPUT 
    
LOOP1:                     
    INC CL
    
    CMP CL,2 
    JNL LOOP2
    
    MOV v1,BL
    JL INPUT  
    
LOOP2:
    
    CMP CL,3
    JNL LOOP3
    
    MOV v2,BL 
    JL INPUT
    
LOOP3:
    
    CMP CL,4
    JNL LOOP4
    
    MOV v3,BL 
    JL INPUT   
       
LOOP4:
    
    CMP CL,5
    JNL LOOP5
    
    MOV v4,BL 
    JL INPUT 
    
LOOP5:
    
    MOV v5,BL 
    JMP INPUT    
    
OUTPUT:
    MOV AH,9 
    LEA DX,nl
    INT 21H
    
    MOV AH,9 
    LEA DX,m3
    INT 21H
    
    MOV AH,2
    MOV DL,v1
    INT 21H 
    
    MOV AH,2
    MOV DL,v2
    INT 21H
    
    MOV AH,2
    MOV DL,v3
    INT 21H
    
    MOV AH,2
    MOV DL,v4
    INT 21H 
    
    MOV AH,2
    MOV DL,v5
    INT 21H   
    
    MOV DL,'.'
    INT 21H 
    
    MOV CL,0 
    
    MOV AH,9 
    LEA DX,nl
    INT 21H
    
    JMP DICISSION
    
EXIT:
    MOV AH,9 
    LEA DX,nl
    INT 21H
    
    MOV AH,9 
    LEA DX,m4
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN