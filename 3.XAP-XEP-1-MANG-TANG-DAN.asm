 

; Program template

 
 

INCLUDE Irvine32.inc

.data
	arr dword 10 DUP(?)
	str1 byte "Nhap so phan tu cua mang: ",0
	str2 byte "Nhap cac phan tu cua mang : ",0dh,0ah,0
	str3 byte "Cac phan tu da nhap : ",0
	str4 byte "Mang sau khi da sap xep  : ",0
	str5 byte " ",0

	n dword ?		;bien luu so phan tu mang
	i dword ? 		;bien luu gia tri vong lap
	point dword ?	; bien con tro cua mang
	temp dword ?
.code
main PROC 
	;hien thi ra chuoi str1
	mov edx,offset str1
	call Writestring

	;tien hanh cho phep nhap so phan tu cua mang 
	mov edx, offset n
	call Readint
	mov [edx],eax


	;in ra chuoi str2
	mov edx,offset str2
	call writestring

	;nhap gia tri cho cac phan tu mang
	;nhap gia tri cua so lan lap vao ecx
	mov ecx,n
	mov edx,offset arr
	lap:
	call Readint
	mov [edx],eax
	add edx,4
	loop lap

	;hien thi ra mang vua nhap vao

	mov edx,offset str3 ;  hien thi ra chuoi
	call writestring
	
	mov ecx, n
	mov esi, offset arr
	lap1:
	mov eax,[esi]
	call writedec
	add esi,4
	mov edx, offset str5
	call writestring
	loop lap1

	mov edx,offset str4		;in ra chuoi hien thi ket qua sap xep
	call writestring

	;thuat toan sap xep noi bot

	mov ebx,n			;so vong lap c 
	dec ebx
	mov ecx,ebx

	lap2:
	;luu gia tri vong lap vao gia tri i
	mov i,ecx
	mov point , 0

	lap3:
	mov edx,point  ; phan tu dau tien 
	mov eax,arr[edx]
	cmp eax,arr[edx+4] ; phan tu thu hai 
	jl tiep ; so sanh 
	;neu dung thi doi cho
	mov temp,eax
	mov eax,arr[edx+4]
	mov arr[edx],eax
	mov eax,temp
	mov arr[edx+4],eax

	tiep:
	add point , 4
	loop lap3

	mov ecx,i
	loop lap2




	;in ra ket qua
	mov ecx,n
	mov edx,0
	call crlf 
	lap5:
	mov eax,arr[edx]
	call writedec
	call crlf 
	add edx,4
	loop lap5
exit
main ENDP
END main