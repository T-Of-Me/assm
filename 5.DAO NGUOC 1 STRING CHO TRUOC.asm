
INCLUDE Irvine32.inc

.data
 
    msg1 BYTE 'Nhap mot chuoi: ', 0
    msg2 BYTE 'Chuoi dao nguoc la: ', 0
    INPUT BYTE 20 DUP(0)     
.code
main proc
 

    ; Hien thi thong bao nhap chuoi
    mov edx, offset msg1
    call writeString

    ; Nhap chuoi tu ban phim
    mov edx, offset INPUT
    mov ecx, 20           
    call readString

    ; Hien thi thong bao chuoi dao nguoc
    call crlf
    mov edx, offset msg2
    call writeString
    mov ecx , eax   ; lay so ki tu 
    ; Dao nguoc chuoi
    lea esi , input
           
    mov ebx, ecx        

L3:
    cmp ebx, 0           
    jl L4                  
    mov al, BYTE PTR [esi+ebx] 
    call writeChar          
    dec ebx                
    jmp L3

L4:
    call crlf             
    main endp
end main
