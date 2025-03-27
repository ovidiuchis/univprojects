Assume cs:code,ds:data
data segment
	a db -2
	b db 2
	c db 4
	d db 5
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov al,a
	add al,b
	add al,c
	add al,1
	imul al
	imul ax
	mov bx,ax
	mov al,b
	imul c
	mov cx,ax
	mov al,a
	cbw
	mov si,ax
	sub si,cx
	mov al,d	
	cbw
	add si,ax
	mov ax,bx
	idiv si
        mov ax,4C00h
	int 21h
code ends
end start
