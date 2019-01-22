.MODEL SMALL
.STACK 100H
.DATA 
    
    msg1 DB 'ENTER ANYTHING: $'
    msg2 DB 'END OF THE JUMP.$'
    nl   DB 0DH,0AH,'$'
    nl1 DB 0DH,0AH,31H,'$'

.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
SHOW_INFO:

    MOV AH,9
    LEA DX,msg1 
    INT 21H  
    
    
INPUT:

    MOV AH,1
    INT 21H
    MOV BL,AL
        
         
OUTPUT:
         
    MOV AH,9  
    LEA DX,nl
    INT 21H
         
    MOV AH,2
    MOV DL,BL
    INT 21H
         
    MOV AH,9
    LEA DX,nl
    INT 21H
            
    ;JMP SHOW_INFO
    CMP BL,'E'
    JE EXIT
    JNE SHOW_INFO
    
    ;JG EXIT
    ;JNG SHOW_INFO
    
    ;JL EXIT
    ;JNL SHOW_INFO 
    
    ;JS EXIT
    ;JNS SHOW_INFO  
         
         
EXIT:
         
    MOV AH,9
    LEA DX,msg2 
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN