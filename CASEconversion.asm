.MODEL SMALL
.STACK 100H 
.DATA
  INPUT DB 80 DUP <?> 
  MASSAGE1 DB "ENTER THE INPUT STRING $"
  MASSAGE2 DB "THE CASECONVERTED STRING $"
                                                                     
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
    
    MOV DI,0
    
L2:  
    MOV DL,INPUT[DI]
    CMP DL,122
    JG OUTPUT  
    CMP DL,65
    JL  OUTPUT 
    CMP DL,91
    JL  CONVERSION
    CMP DL,97
    JGE CONVERSION
    JL   OUTPUT
    
CONVERSION:XOR DL,32
    JMP  OUTPUT
OUTPUT:
    INT 21H
    INC DI
    CMP DI,SI
    JNZ L2
MAIN ENDP
END MAIN   