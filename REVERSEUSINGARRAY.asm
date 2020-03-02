.MODEL SMALL
.STACK 100H 
.DATA
  INPUT DB 80 DUP <?> 
  MASSAGE1 DB "ENTER THE INPUT STRING $"
  MASSAGE2 DB "THE REVERSE STRING $"
                                                                     
.CODE

MAIN PROC
    
    MOV SI,0
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,MASSAGE1
    INT 21H  
    
    MOV AH,2 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    MOV AH,1
NEXT:
   INT 21H  
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
    
    MOV AH,9 
    LEA DX,MASSAGE2
    INT 21H  
    
    MOV AH,2 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
   
    
L2: DEC SI
    MOV DL,INPUT[SI]
    INT 21H 
    CMP SI,0
    JNZ L2
MAIN ENDP
END MAIN   