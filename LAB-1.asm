.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;MOV BH,31D
   
    ;SHL BH,1 
    ;SHL BH,1
    ;SHL BH,1
    ;SHL BH,1
    
    ;SHR BH,1
    ;SHR BH,1
    ;SHR BH,1
    ;SHR BH,1 
    
    ;SHR BH,3  
    
    MOV BH,10011111B
    
    ROL BH,4
    
    ROR BH,2   
    
    RCL BH,4
    RCR BH,9
    
    
    MOV AH,4CH
    INT 21H 
    
    MAIN ENDP
END MAIN