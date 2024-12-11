INCLUDE Irvine32.inc

 
.data
  
    msg1 BYTE 'Nhap chuoi: ', 0
    msg2 BYTE 0
    msg3 BYTE 'Nhap ky tu can dem: ', 0
    msg4 BYTE 'So ky tu trong chuoi la: ', 0
    INPUT BYTE 20 DUP(0)
    INPUT1 BYTE 1 DUP(0)

.code
main proc

    mov edx, offset msg
    call writeString
    call crlf

    mov edx, offset msg1
    call writeString
    mov edx, offset INPUT
    mov ecx, 20
    call readString
    call crlf

    mov edx, offset msg3
    call writeString
    mov edx, offset INPUT1
    mov ecx, 2
    call readString
    call crlf

    mov esi, offset INPUT    
    mov dl, BYTE PTR [offset INPUT1] 
    mov eax, 0
    L1:
        cmp BYTE PTR [esi], 0
        je L3
        cmp BYTE PTR [esi], dl   ; neu trung thi cong vao eax 
        jne L2
        add eax, 1
    L2:
        inc esi
        jmp L1

    L3:
    mov edx, offset msg4
    call writeString
    call writeDec
    call crlf

    main endp
    end main
