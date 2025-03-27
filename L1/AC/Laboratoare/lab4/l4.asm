assume cs:code,ds:data
data segment
a db 15 dup('$')
data ends
code segment
afiscf PROC
      mov dl,al
      mov ah,02h
      int 21h
      jmp e1
afiscf endp

adaug PROC
    stosb
    jmp repeta
adaug endp
afisstr PROC
    mov dx,offset a
    mov ah,09h
    int 21h
afisstr endp

start:
mov ax,data

mov ds,ax
mov es,ax
cld
mov di,offset a
mov bh,'$'
mov bl,'9'

repeta:
mov ah,07h
int 21h
;al<-caracter citit
cmp bh,al
je final
cmp bl,al
jae  afiscf
e1:
cmp bl,al
jb  adaug
jmp repeta

final:
call afisstr
mov ax,4c00h
int 21h
code ends
end start
