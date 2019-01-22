.MODEL SMALL
.STACK 100H
.DATA
    
    a DW ?
    b DW ?
    sum DW ?
    
    nl DB 0DH,0AH,'$'
    me DB 'END OF PROGRAM.$'
    m1 DB 'ENTER THE FIRST 16 BIT HEX NUMBER(0-9,A-F) : $'
    m2 DB 'ENTER THE SECOND 16 BIT HEX NUMBER(0-9,A-F) : $'
    m3 DB 'ADDITION ANSWER IN 16 BIT HEX: $'
    m4 DB 'ADDITION ANSWER IN 16 BIT BINARY: $'
    
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX   
    
    MOV AH,9
    LEA DX,m1
    INT 21H
    
    CALL HEXA_INPUT
    
    MOV a,BX
            
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    LEA DX,m2
    INT 21H
    
    CALL HEXA_INPUT
    
    MOV b,BX   
    
    CALL ADDITION
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    LEA DX,m3
    INT 21H  
    
    CALL HEXA_RESULT_OUTPUT
        
    
EXIT:
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    LEA DX,me
    INT 21H
       
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP 



HEXA_INPUT PROC         
    
    MOV BX,0000H
    MOV CL,30H
    
INPUT_HEXA_INPUT:    
    CMP CL,34H
    JE RETURN
    
    MOV AH,1
    INT 21H
    
    MOV DX,AX
    
    CMP DX,0139H
    JLE NUMBER_CONVERSION
    
    CMP DX,0141H
    JGE ALPHABET_CONVERSION 
    
    
NUMBER_CONVERSION:
    
    CMP DX,0130H
    JNGE INPUT_HEXA_INPUT
    
    SUB DX,0130H 
      
    INC CL    
               
    ADD BX,DX
    
    ;MOV a,BX
              
    CMP CL,34H
    JE INPUT_HEXA_INPUT   
         
    SHL BX,4  
    
    JMP INPUT_HEXA_INPUT   
                    
                    
ALPHABET_CONVERSION:
    
    CMP DX,0146H
    JNLE INPUT_HEXA_INPUT
    
    SUB DX,0137H 
      
    INC CL    
               
    ADD BX,DX
    
    ;MOV a,BX
              
    CMP CL,34H
    JE INPUT_HEXA_INPUT   
         
    SHL BX,4  
    
    JMP INPUT_HEXA_INPUT   
    
RETURN:
    
    RET
    
    HEXA_INPUT ENDP
    
    
ADDITION PROC
    
    MOV BX,a
    MOV DX,b
    
    ADD BX,DX
    
    MOV sum,BX  
    
    RET
    
    ADDITION ENDP  



HEXA_RESULT_OUTPUT PROC   
    
    MOV BX,sum 
    MOV CL,00H
    
SHR:
    
    SHR BX,12
    
    CMP BX,000AH
    JGE ALPH_HEX 
    
    ADD BX,0030H
    
    MOV AH,2
    MOV DX,BX
    INT 21H
    
BACK:
    
    INC CL
    
    MOV BX,sum 
    MOV CH,00H
    
    CMP CL,00H 
    JG SHL
    
SHL:
    CMP CL,04H
    JE FINISH
    
    CMP CH,CL
    JE SHR
    
    SHL BX,4   
    
    INC CH
    
    JMP SHL 
        

ALPH_HEX:
 
    
    ADD BX,0037H  
    
    MOV AH,2
    MOV DX,BX
    INT 21H
    
    JMP BACK 
    
FINISH:    
    RET
    
    HEXA_RESULT_OUTPUT ENDP     

                        
END MAIN