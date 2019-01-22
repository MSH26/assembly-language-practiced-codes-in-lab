.MODEL SMALL
.STACK 100H 
.DATA
.CODE   

MAIN PROC
    
;NAME: CODE COMMENT   


    MOV AH,2 
    MOV DL,'C'
    INT 21H     
    MOV DL,'O'
    INT 21H    
    MOV DL,'D'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,':'
    INT 21H
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    MOV DL,9
    INT 21H  
    
    
    
    MOV DL,'#'
    INT 21H     
    MOV DL,'i'
    INT 21H    
    MOV DL,'n'
    INT 21H
    MOV DL,'c'
    INT 21H
    MOV DL,'l'
    INT 21H
    MOV DL,'u'
    INT 21H
    MOV DL,'d'
    INT 21H
    MOV DL,'e'
    INT 21H    
    MOV DL,'<'
    INT 21H
    MOV DL,'i'
    INT 21H    
    MOV DL,'o'
    INT 21H 
    MOV DL,'s'
    INT 21H
    MOV DL,'t'
    INT 21H
    MOV DL,'r'
    INT 21H
    MOV DL,'e'
    INT 21H
    MOV DL,'a'
    INT 21H
    MOV DL,'m'
    INT 21H
    MOV DL,'>'
    INT 21H   
    
    
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H   
    
    
    MOV DL,'i'
    INT 21H
    MOV DL,'n'
    INT 21H
    MOV DL,'t'
    INT 21H    
    MOV DL,' '
    INT 21H
    MOV DL,'m'
    INT 21H
    MOV DL,'a'
    INT 21H
    MOV DL,'i'
    INT 21H
    MOV DL,'n'
    INT 21H
    MOV DL,'('
    INT 21H
    MOV DL,')'
    INT 21H 
    MOV DL,'{'
    INT 21H  
    
    
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    MOV DL,9
    INT 21H  
    
      
    MOV DL,'c'
    INT 21H
    MOV DL,'o'
    INT 21H
    MOV DL,'u'
    INT 21H
    MOV DL,'t'
    INT 21H
    MOV DL,'<'
    INT 21H
    MOV DL,'<'
    INT 21H
    MOV DL,'"'
    INT 21H
    MOV DL,'H'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,'L'
    INT 21H
    MOV DL,'L'
    INT 21H
    MOV DL,'O'
    INT 21H
    MOV DL,' '
    INT 21H   
    MOV DL,'B'
    INT 21H
    MOV DL,'O'
    INT 21H
    MOV DL,'Y'
    INT 21H
    MOV DL,'S'
    INT 21H
    MOV DL,' '
    INT 21H  
    MOV DL,'O'
    INT 21H  
    MOV DL,'F'
    INT 21H   
    MOV DL,' '
    INT 21H
    MOV DL,'C'
    INT 21H
    MOV DL,'S'
    INT 21H    
    MOV DL,'E'
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,'D'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,'P'
    INT 21H
    MOV DL,'T'
    INT 21H    
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H  
    MOV DL,'"'
    INT 21H
    MOV DL,';'
    INT 21H  
               
               
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H   
    MOV DL,9
    INT 21H 

    
    MOV DL,'c'
    INT 21H
    MOV DL,'o'
    INT 21H
    MOV DL,'u'
    INT 21H
    MOV DL,'t'
    INT 21H
    MOV DL,'<'
    INT 21H
    MOV DL,'<'
    INT 21H
    MOV DL,'"'
    INT 21H
    MOV DL,'L'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,'T'
    INT 21H   
    MOV DL,96
    INT 21H
    MOV DL,'S'
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,'W'
    INT 21H   
    MOV DL,'R'
    INT 21H
    MOV DL,'I'
    INT 21H
    MOV DL,'T'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,' '
    INT 21H  
    MOV DL,'A'
    INT 21H  
    MOV DL,' '
    INT 21H   
    MOV DL,'C'
    INT 21H
    MOV DL,'O'
    INT 21H
    MOV DL,'D'
    INT 21H    
    MOV DL,'E'
    INT 21H  
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H  
    MOV DL,'"'
    INT 21H
    MOV DL,';'
    INT 21H  
            
            
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H         
    
    MOV DL,'}'
    INT 21H    
           
           
    ;NAME: OUTPUT COMMENT
               
               
    MOV DL,10
    INT 21H 
    MOV DL,13
    INT 21H 
    MOV DL,10
    INT 21H 
              
              
    MOV DL,'O'
    INT 21H
    MOV DL,'U'
    INT 21H
    MOV DL,'T'
    INT 21H
    MOV DL,'P'
    INT 21H
    MOV DL,'U'
    INT 21H
    MOV DL,'T'
    INT 21H    
    MOV DL,':'
    INT 21H  
    
    
    MOV DL,10
    INT 21H
     
    
    MOV DL,'H'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,'L'
    INT 21H
    MOV DL,'L'
    INT 21H
    MOV DL,'O'
    INT 21H
    MOV DL,' '
    INT 21H   
    MOV DL,'B'
    INT 21H
    MOV DL,'O'
    INT 21H
    MOV DL,'Y'
    INT 21H
    MOV DL,'S'
    INT 21H
    MOV DL,' '
    INT 21H  
    MOV DL,'O'
    INT 21H  
    MOV DL,'F'
    INT 21H   
    MOV DL,' '
    INT 21H
    MOV DL,'C'
    INT 21H
    MOV DL,'S'
    INT 21H    
    MOV DL,'E'
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,'D'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,'P'
    INT 21H
    MOV DL,'T'
    INT 21H    
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H  
                 
                 
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H   
             
             
    INT 21H
    MOV DL,'L'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,'T'
    INT 21H   
    MOV DL,96
    INT 21H
    MOV DL,'S'
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,'W'
    INT 21H   
    MOV DL,'R'
    INT 21H
    MOV DL,'I'
    INT 21H
    MOV DL,'T'
    INT 21H
    MOV DL,'E'
    INT 21H
    MOV DL,' '
    INT 21H  
    MOV DL,'A'
    INT 21H  
    MOV DL,' '
    INT 21H   
    MOV DL,'C'
    INT 21H
    MOV DL,'O'
    INT 21H
    MOV DL,'D'
    INT 21H    
    MOV DL,'E'
    INT 21H  
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H   
    MOV DL,'!'
    INT 21H  


    MAIN ENDP
END MAIN 