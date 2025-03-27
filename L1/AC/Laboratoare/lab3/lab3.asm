assume cs:code,ds:data
data segment
     a db 2, 7, 1, 2, 2
     ln equ $-a
     b db 2
     c db ln dup(?)
     data ends
code segment
start:
     mov ax,data
     mov ds,ax
     mov es,ax
     mov cx,ln
     mov si,offset a
     cld
     mov di, offset c
     
     repeta:
            lodsb
            cmp al,b
            je adauga
            next:
            dec cx
            cmp cx,0
            ja repeta
    jcxz final
    adauga:

           mov ax,si
           stosb
           cmp cx,0
           ja next
         final:
      mov ax,4C00h
      int 21h
code ends
end start