    .MODEL SMALL
.STACK 100H 
.DATA
  INPUT DB 80 DUP <?>
  STR   DB 80 DUP <?>
  MASS  DB  "ENTER INPUT STRING $"
  vowelM DB  "NUMBER OF VOWEL $"
  conM   DB  "NUMBER OF CONCONENT $"
  digitM DB  "NUMBER OF DIGIT $"
  spaceM DB  "NUMBER OF SPACE $" 
  DIGIT DB 48
  SPACE DB 48
  
.CODE

MAIN PROC
    
    MOV SI,0
    MOV CL,48
    MOV BL,48
    MOV AX,@DATA
    MOV DS,AX
     
       
     
        
    MOV AH,9
    LEA DX,MASS
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
       
    MOV AH,1
     
      
NEXT: INT 21H  
      CMP AL,0DH
      JZ L1
      MOV INPUT[SI],AL
      INC SI
      JMP NEXT 
          
L1: 
      MOV AH,2 
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H 
      
L2:  
    DEC SI 
       

    CMP INPUT[SI],65
    JG  OUTPUT 
    
   
  OUTPUT:
          CMP SI,0
          JNZ L2
           
           
          MOV AH,9
          LEA DX,vowelM
          INT 21H
    
          MOV AH,2
           
          MOV DL,CL 
          INT 21H 
          
          MOV DL,0AH
          INT 21H
          MOV DL,0DH
          INT 21H 
          
          MOV AH,9
          LEA DX,conM
          INT 21H
    
          MOV AH,2
          
          MOV DL,BL 
          INT 21H
            
          MOV DL,0AH
          INT 21H
          MOV DL,0DH
          INT 21H  
          
          MOV AH,9
          LEA DX,digitM
          INT 21H
    
          MOV AH,2
          
          MOV DL,DIGIT 
          INT 21H  
          
          MOV DL,0AH
          INT 21H
          MOV DL,0DH
          INT 21H
                   
          MOV AH,9
          LEA DX,spaceM
          INT 21H
    
          MOV AH,2
          MOV DL,SPACE 
          INT 21H
          
          
  
  MAIN ENDP
END MAIN