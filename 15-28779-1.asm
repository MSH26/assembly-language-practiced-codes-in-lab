.MODEL SMALL
.STACK 100H
.DATA
     
     a DB ?
     b DB ?
     result DW ?
     
     st0 DB 'PLEASE INPUT THE FIRST DECIMAL(2 DIGIT ONLY) NUMBER : $'
     st1 DB 'PLEASE INPUT THE SECOND DECIMAL(2 DIGIT ONLY) NUMBER : $'
     st2 DB 'OUTPUT IN BINARY : $'
     st3 DB 'OUTPUT IN HEXA : $'
     st4 DB 'PROGRAM END!!!' 
     
     nl DB 0DH,0AH,'$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
START:
    
    MOV AH,9
    LEA DX,st0
    INT 21H
    
    CALL DEC_INP
    
    MOV a,BH  
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    LEA DX,st0
    INT 21H 
    
    CALL DEC_INP  
    
    MOV b,BH 
    
    CALL DEC_MULT 
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    LEA DX,st2
    INT 21H 
    
    CALL BIN_OUT 
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    LEA DX,st3
    INT 21H
    
    CALL HEX_OUT  
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    LEA DX,st4
    INT 21H
    
    
EXIT: 

    MOV AH,4CH
    INT 21H
    
    MAIN ENDP 


;DECIMAL INPUT FUNCTION 

DEC_INP PROC 
    
    MOV CL,00H
    MOV BH,00H
    
DEC_INPUT:    
    
    CMP CL,02H
    JGE RETURN
    
    MOV AH,1
    INT 21H
    
    CMP AL,39H
    JLE NUM_CON
    
NUM_CON:
    
    INC CL
    
    SUB AL,30H
    ADD BH,AL
    
    CMP CL,01H
    JE DEC_INP_MUL
    
    JMP DEC_INPUT
     
    
DEC_INP_MUL:
    
    MOV AL,0AH
    
    MUL BH  
    
    MOV BH,AL
    
    JMP DEC_INPUT    
    
RETURN:
    RET
    
    DEC_INP ENDP     


;MULTIPLICATION FUNCTION

DEC_MULT PROC
    
    POP DX
    
    XOR AX,AX
    
    MOV AL,a
    MOV BL,b
    
    MUL BL 
    
    MOV BX,AX 
    
    MOV result,BX 
    
    PUSH DX 
    
    RET
    
    DEC_MULT ENDP


;BINARY OUTPUT FUNCTION

BIN_OUT PROC
    
    MOV BX,result
    MOV CL,00H  
    MOV AH,2
    
BIN_OUTPUT:
    
    CMP CL,11H
    JE BIN_OUT_RET
    
    INC CL
    
    SHL BX,1
    JC BIN_OUT_ONE 
    
    MOV DL,30H
    INT 21H   
    
    JMP BIN_OUTPUT
    
BIN_OUT_ONE:  
    
    MOV DL,31H
    INT 21H 
    
    JMP BIN_OUTPUT
    
BIN_OUT_RET:
    
    RET
    
    BIN_OUT ENDP 


;HEXA OUTPUT

HEX_OUT PROC  
    
    MOV BX,result 
    MOV CL,00H
    
    SHR BH,4
    
    CMP BH,09H
    JLE HEX_OUT_NUM
    
    CMP BH,0AH
    JGE HEX_OUT_ALP 
    
SECOND:
    
    MOV BX,result 
    
    SHL BH,4 
    SHR BH,4
    
    CMP BH,09H
    JLE HEX_OUT_NUM
    
    CMP BH,0AH
    JGE HEX_OUT_ALP
    
THIRD:
    
    MOV BX,result 
    
    SHR BL,4
    
    MOV BH,BL 
    
    CMP BH,09H
    JLE HEX_OUT_NUM
    
    CMP BH,0AH
    JGE HEX_OUT_ALP   
    
FORTH:
    
    MOV BX,result 
    
    SHL BL,4
    SHR BL,4
    
    MOV BH,BL 
    
    CMP BH,09H
    JLE HEX_OUT_NUM
    
    CMP BH,0AH
    JGE HEX_OUT_ALP
    
    JMP RETURN_HEX
    
HEX_OUT_NUM:
    ADD BH,30H 
    
    INC CL
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    CMP CL,01H 
    JE SECOND
    
    CMP CL,02H 
    JE THIRD
    
    CMP CL,03H 
    JE FORTH   
    
    
HEX_OUT_ALP:
    ADD BH,37H 
    
    INC CL
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    CMP CL,01H 
    JE SECOND
    
    CMP CL,02H 
    JE THIRD
    
    CMP CL,03H 
    JE FORTH  
    
RETURN_HEX:
    RET
    
    HEX_OUT ENDP
    
END MAIN