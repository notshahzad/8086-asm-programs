org 100h

.code
mov ah,1
input:
    inc di
    int 21h  
    mov [di], al
    cmp byte [di], 13
    je search
    jne input
search:
    mov bx, di
    inc bx
    mov cx, bx
    mov di, 0
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    mov ah, 1
    int 21h 
  loop:
    inc di
    cmp byte [di], al
    je branch
    jne pass
    branch:
    inc bx
    mov si, cx
    add byte [si],01h 
    mov [bx], di
    cmp byte [di], 13
    je ex
    jne loop
    pass:
    mov [bx + 1], 0
    cmp byte [di], 13
    jne loop
ex:
mov ah, 2
mov dl, 10
int 21h
mov dl, 13
int 21h
mov dl, 10
int 21h
mov dl, 13
int 21h
mov ah,0x00
    mov al, 0x00
    mov al, [si]
    mov bl, 10
    div bl
    mov dh,ah
    mov dl, al
    add dl,48
    add dh, 48
    mov ah, 2
    int 21h
    mov dl, dh
    int 21h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    mov bl, 00
    mov bx, 00
mov bx, cx
cmp byte [bx + 1], 0
je exit
print:    
    inc cx
    mov bx,cx
    mov ah,0x00
    mov al, 0x00
    mov al, [bx]
    mov bl, 10
    div bl
    mov dh,ah
    mov dl, al
    add dl,48
    add dh, 48
    mov ah, 2
    int 21h
    mov dl, dh
    int 21h
    mov dl, 32
    int 21h
    mov bl, 00
    mov bx, 00
    mov bx,cx
    cmp byte [bx + 1], 0
    jne print  
    je exit
exit:
hlt