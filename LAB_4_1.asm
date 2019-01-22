.MODEL SMALL
.STACK 100H
.DATA 
    
    msg DB 'PRESS A KEY (1-5 OR G):$'
    
    msglfs DB 'YOU ARE AT FLOOR $'

    msglfe DB 'GROUND FLOOR$'
    
    nl   DB 0DH,0AH,'$'

.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 

SHOW_INFO:
    MOV AH,9
    LEA DX,msg
    INT 21H    

INPUT:
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    CMP BL,'G'
    JE OUT_END
    
    MOV AH,9
    LEA DX,msglfs 
    INT 21H  
    
    MOV AH,2
    MOV DL,BL
    INT 21H 
    
    MOV AH,9
    LEA DX,nl
    INT 21H
    
    CMP BL,'5'
    JLE SHOW_INFO 
    
    
OUT_END:
    
    MOV AH,9
    LEA DX,msglfe
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN