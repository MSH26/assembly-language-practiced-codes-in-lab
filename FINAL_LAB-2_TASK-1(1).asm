.MODEL SMALL
.STACK 100H
.DATA
    
    a DB ?
    
    st0 DB 'Input:$'
    st1 DB 'Output1:$'
    st2 DB 'Output2:$'
    
    nl DB 0DH,0AH,'$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,st0
    INT 21H   
    
    MOV CL,30H 
    MOV CH,00H
    
INPUT: 

    CMP CL,38H
    JE OUTPUT1
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    
    SUB BL,48 
      
    INC CL    
               
    ADD CH,BL
              
    CMP CL,38H
    JE OUTPUT1   
         
    SHL CH,1  
    
    JMP INPUT
    
    
OUTPUT1:        
    
    MOV a,CH
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    MOV AH,9
    LEA DX,st1
    INT 21H  
    
    MOV CL,30H

OUTPUT1_OP:
    
    CMP CL,38H
    JE OUTPUT2
    
    SHR CH,1
    JC OUT1_1
    JNC OUT1_0
    
OUT1_1:
    
    MOV AH,2
    MOV DL,31H
    INT 21H    
    
    INC CL
    
    JMP OUTPUT1_OP
              
OUT1_0:
    
    MOV AH,2
    MOV DL,30H
    INT 21H     
    
    INC CL
    
    JMP OUTPUT1_OP

OUTPUT2: 
    
    MOV AH,9
    LEA DX,nl
    INT 21H
        
    MOV AH,9
    LEA DX,st2
    INT 21H  
    
    MOV CL,30H 
    
    MOV CH,a

OUTPUT2_OP:
    
    CMP CL,39H
    JE EXIT
    
    ROR CH,1
    JC OUT2_1
    JNC OUT2_0
    
OUT2_1:
    
    INC CL
    
    CMP CL,31H
    JE OUTPUT2_OP
    
    MOV AH,2
    MOV DL,31H
    INT 21H    
    
    JMP OUTPUT2_OP
              
OUT2_0:
    
    INC CL
    
    CMP CL,31H
    JE OUTPUT2_OP
    
    MOV AH,2
    MOV DL,30H
    INT 21H     
    
    JMP OUTPUT2_OP

EXIT:
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN