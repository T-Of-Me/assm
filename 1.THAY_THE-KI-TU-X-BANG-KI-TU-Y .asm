INCLUDE Irvine32.inc

 
.data
 
    msg1 BYTE 'Nhap chuoi: ', 0
    msg2 BYTE 0
    msg3 BYTE 'Nhap ky tu can thay doi: ', 0
    msg4 BYTE 'Ky tu ', 0
    msg5 BYTE ' thay doi thanh: ', 0
    msg6 BYTE 'Chuoi sau khi thay doi: ', 0
    INPUT BYTE 20 DUP(0)
    INPUT1 BYTE 2 DUP(0)
    INPUT2 BYTE 2 DUP(0)

.code
main proc

 

    lea edx , msg1
    call writeString
    lea edx , input
    mov ecx, 20
    call readString ; 
    call crlf

     lea edx , msg3
    call writeString
    lea edx , input1
    mov ecx, 2
    call readString
    call crlf

    lea edx , msg4
    call writeString
    mov edx, offset INPUT1  
    call writeString

    lea edx , msg5
    call writeString
    mov edx, offset INPUT2
    mov ecx, 2
    call readString
    call crlf

 
    lea esi , input
    mov dl, BYTE PTR [offset INPUT2] 
    mov al, BYTE PTR [offset INPUT1] 
    
   
    L1:
        cmp BYTE PTR [esi], 0
        je L3
        cmp BYTE PTR [esi], al  ; tim kiem ki tu can thay the 
        jne L2
        mov BYTE PTR [esi], dl  ; neu bang chuyen ki tu 
    L2:
        inc esi
        jmp L1

    L3:
        lea edx , msg6
    call writeString
    mov edx, offset INPUT
    call writeString
    call crlf

    main endp
    end main
