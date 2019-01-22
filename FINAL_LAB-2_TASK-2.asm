.MODEL SMALL
.STACK 100H
.DATA
    
    a DB ?
    b DB 0D
    
    st1 DB 'PLEASE TAKE A BINARY INPUT : $'
    st2 DB 'THE OUTPUT IN HEXA : $'
    
    nl DB 0DH,0AH,'$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV CL,30H 
    MOV BH,00H 
    MOV CH,30H  
    
    MOV AH,9
    LEA DX,st1
    INT 21H
    
INPUT:         

    CMP CL,38H
    JE CONVERSION1
    
    MOV AH,1
    INT 21H
    
    MOV BH,AL
    
    SUB BH,48 
      
    INC CL    
               
    ADD BL,BH
    
    MOV a,BL
              
    CMP CL,38H
    JE CONVERSION1   
         
    SHL BL,1  
    
    JMP INPUT  
    
    ;MOV BL,10110110B
       
CONVERSION1:   
    
    MOV DL,BL
    
    SHR DL,4 
    
    MOV BL,DL 
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    MOV AH,9
    LEA DX,st2
    INT 21H
    
    CMP DL,9D
    JLE OUTPUT1
    JG OUTPUT2  
    
CONVERSION2: 
    
    MOV BH,1
    MOV b,1   
    
    MOV DL,a
    
    SHL DL,4 
    
    ROL DL,4 
    
    MOV BL,DL
    
    CMP DL,9D
    JLE OUTPUT1
    JG OUTPUT2
    
    
OUTPUT1: 
    
    MOV AH,2
    
    ADD BL,48 
    
    MOV DL,BL
    INT 21H   
    
    INC CH 
       
    CMP b,0D
    JE CONVERSION2
    JNE EXIT
    
    
OUTPUT2:
    
    MOV AH,2
    
    ADD BL,55 
    
    MOV DL,BL
    INT 21H  
    
    INC CH
    
    CMP b,0D
    JE CONVERSION2
    JNE EXIT
    
EXIT:    
    
    MOV AH,4CH 
    INT 21H
    
    MAIN ENDP
END MAIN