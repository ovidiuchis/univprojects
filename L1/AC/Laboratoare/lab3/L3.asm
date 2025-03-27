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
      mov si,0
      mov cx,ln
      mov dl,0
      jcxz final
      repeta:
             mov al,byte ptr a[si]
             cmp al,b
             je adauga
             inc si
             dec cx
      cmp cx,0
      ja repeta
      jcxz final
      adauga:
             mov bx,si
             mov byte ptr c[si],bl
             add bl,1
             add dl,bl
             inc si
             dec cx
             cmp cx,0
             ja repeta
      final:
      mov ax,4C00h
      int 21h
code ends
end start