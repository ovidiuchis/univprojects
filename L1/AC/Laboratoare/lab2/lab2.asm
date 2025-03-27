assume cs:code, ds:data
data segment
     a dw 1010101010101011b
     b dw 1100110011001100b
     c dw ?
data ends
code segment
start:
      mov ax,data
      mov ds,ax
      mov dx,0
      mov al,byte ptr b+1;al=11001100
      and al,00111111b
      mov dl,al ;dl=00001100
      mov si,a;si=1010101010101011
      mov cl,3
      shl si,cl
      and si,0001111111000000b
      add dx,si;dx=0000101010000110
      mov bx,a   ;bl=10101011
      mov cl,5
      shl bl,cl
      add dh,bl
      mov c,dx;c=0111010101001100b sau  754Ch
      mov ax,4C00h
      int 21h
code ends
end start
