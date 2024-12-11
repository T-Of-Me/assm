INCLUDE Irvine32.inc

.data
    msg BYTE "nhap chuoi : ", 0     
    msg1 BYTE " chuoi encode: ", 0  
    msg2 BYTE "chuoi decode :", 0  
    encodedMessage BYTE 100 DUP(?)
    Message BYTE 100 DUP(?)
    key BYTE 5            
    count dword ? 

.code
main PROC
    lea edx , msg 
    call writestring 

    lea edx , Message
    mov ecx , 100 
    call readstring 

   lea esi , Message
   mov ecx , eax 
   mov count , ecx 
encode_loop:
    mov al, [esi]                           
    xor al, key                              
    mov [esi], al                         
    inc esi                                  
                                
    loop encode_loop
    lea edx , msg 
    call writestring 
 
    lea edx , Message
    call WriteString
    call Crlf
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; decode 
   lea esi , Message
   mov ecx , count    
decode_loop:
    mov al, [esi]                           
    xor al, key                             
    mov [esi], al                            
    inc esi                                  
                           
    loop decode_loop

    lea edx , msg2
    call writestring 

     
     lea edx , Message
    call WriteString
    call Crlf
 

    exit
main ENDP
END main