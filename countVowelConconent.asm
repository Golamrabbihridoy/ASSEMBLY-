.MODEL SMALL
.STACK 100H 
.DATA
  INPUT DB 80 DUP <?> 
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
    
    

    CMP INPUT[SI],122
    JG  OUTPUT 
    
    CMP INPUT[SI],32
    JZ  SPA
     
    CMP INPUT[SI],48
    JL  OUTPUT
    
    CMP INPUT[SI],58
    JL  DIG
    
     
    CMP INPUT[SI],65
    JL  OUTPUT
                
    CMP INPUT[SI],90
    JG L3
    JLE L4
    
  L3:CMP INPUT[SI],97
    JL  OUTPUT

  L4:CMP INPUT[SI],'A'
    JZ  VOWEL 
    CMP INPUT[SI],'a'
    JZ  VOWEL 
    CMP INPUT[SI],'E'
    JZ  VOWEL  
    CMP INPUT[SI],'e'
    JZ  VOWEL  
                
    CMP INPUT[SI],'I'
    JZ  VOWEL 
    CMP INPUT[SI],'i'
    JZ  VOWEL
    
    CMP INPUT[SI],'O'
    JZ  VOWEL 
    CMP INPUT[SI],'O'
    JZ  VOWEL 
    
    CMP INPUT[SI],'U'
    JZ  VOWEL 
    CMP INPUT[SI],'u'
    JZ  VOWEL   
    JMP CONCONET    

VOWEL:
    ADD CL,1
    CMP SI,0
    JNZ L2
    JZ OUTPUT
CONCONET:
    ADD BL,1
    CMP SI,0
    JNZ L2
    JZ OUTPUT
DIG:
    INC DIGIT
    CMP SI,0
    JNZ L2
    JZ OUTPUT
    
SPA:
   INC SPACE
     
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