IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
ReturnAddress dw ?
cCone db 0
cGame db 0
numlength db 0
score dw 0
cRandom dw 0
cSleep dw 25000 
randomArray dw 5 dup (150, 240, 60)
yBackground dw 180
xBackground dw 0
yBoarders dw 0
xBoarders dw 110
yGround dw 0
xGround dw 0
yPerson dw 125 
xPerson dw 142
colorPerson db 3
yObstacle dw 0
xObstacle dw 150
black db 0
msg1 db 'Press enter to start!$'
msg2 db 'GAME OVER!$'
msg3 db 'Your score: $'
msg4 db 'To restart press Enter.$'
msg5 db 'To stop playing press space.$'
filename db 'pic.bmp',0
filehandle dw ?
Header db 54 dup (0)
Palette db 256*4 dup (0)
ScrLine db 320 dup (0)
ErrorMsg db 'Error', 13, 10,'$'

; --------------------------
CODESEG

proc  printnum

	pop [ReturnAddress]
	pop ax
	cmp ax,0
	jne sof2
	mov dl,'0'
	mov ah, 2h
	int 21h
	jmp endz
	sof2:
		mov bx,10
	loop1:
		inc [numlength]
		xor dx,dx
		div bx
		mov cx,ax
		add dx,'0'
		push dx 
		mov ax,cx
		cmp ax,0
		ja loop1 
	lessthanzero:
		pop dx  
		mov ah, 2h
		int 21h
		dec [numlength]
		cmp [numlength],0
		jne lessthanzero
	endz:
	push [ReturnAddress]
	
ret
endp  printnum

proc ground

	mov cx, 10
	wigdth:
		mov [yGround], 0
		push cx
		mov cx, 200
		heigth6:
			push cx
			mov bh,0h
			mov cx,[xGround]
			mov dx,[yGround]
			mov al, 10
			mov ah,0ch
			int 10h
			inc [yGround]
			pop cx
		loop heigth6
		pop cx 
		inc [xGround]
	loop wigdth
	mov [xGround], 311
	mov [yGround], 0
	mov cx, 10
	wigdth9:
		mov [yGround], 0
		push cx
		mov cx, 200
		heigth9:
			push cx
			mov bh,0h
			mov cx,[xGround]
			mov dx,[yGround]
			mov al, 10
			mov ah,0ch
			int 10h
			inc [yGround]
			pop cx
		loop heigth9
		pop cx 
		inc [xGround]
	loop wigdth9
	
ret
endp ground

proc background

	mov cx, 320
	wigdth7:
		mov [yBackground], 0
		push cx
		mov cx, 200
		heigth7:
			push cx
			mov bh,0h
			mov cx,[xBackground]
			mov dx,[yBackground]
			mov al, 25
			mov ah,0ch
			int 10h
			inc [yBackground]
			pop cx
		loop heigth7
		pop cx 
		inc [xBackground]
	loop wigdth7
	mov [yBoarders],0
	mov [xBoarders], 305
	mov cx, 200
	boarder3:
		push cx
		mov bh,0h
		mov cx,[xBoarders]
		mov dx,[yBoarders]
		mov al, 30
		mov ah,0ch
		int 10h
		inc [yBoarders]
		pop cx
	loop boarder3
	mov [yBoarders],0
	mov [xBoarders], 15
	mov cx, 200
	boarder4:
		push cx
		mov bh,0h
		mov cx,[xBoarders]
		mov dx,[yBoarders]
		mov al, 30
		mov ah,0ch
		int 10h
		inc [yBoarders]
		pop cx
	loop boarder4
	mov [yBoarders],0
	mov [xBoarders], 110 
	
ret
endp background

proc boarders 

	mov cx, 20
	boarder1:
		push cx
		mov cx, 5
		white1:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 30
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop white1
		mov cx, 5
		black1:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 25
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop black1
		pop cx
	loop boarder1
	mov [yBoarders],0
	mov [xBoarders], 210
	mov cx, 20
	boarder2:
		push cx
		mov cx, 5
		white2:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 30
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop white2
		mov cx, 5
		black2:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 25
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop black2
		pop cx
	loop boarder2
	mov [yBoarders],0
	mov [xBoarders], 110 
	
ret
endp boarders

proc boarders2 

	mov cx, 20
	boarder5:
		push cx
		mov cx, 5
		white5:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 25
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop white5
		mov cx, 5
		black5:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 30
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop black5
		pop cx
	loop boarder5
	mov [yBoarders], 0
	mov [xBoarders], 210
	mov cx, 20
	boarder6:
		push cx
		mov cx, 5
		white6:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 25
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop white6
		mov cx, 5
		black6:
			push cx
			mov bh,0h
			mov cx,[xBoarders]
			mov dx,[yBoarders]
			mov al, 30
			mov ah,0ch
			int 10h
			inc [yBoarders]
			pop cx 
			loop black6
		pop cx
	loop boarder6
	mov [yBoarders], 0
	mov [xBoarders], 110 
	
ret
endp boarders2

proc deleteBoarders

	mov cx, 200
	boarder555:
		push cx
		mov bh,0h
		mov cx,[xBoarders]
		mov dx,[yBoarders]
		mov al, 25
		mov ah,0ch
		int 10h
		inc [yBoarders]
		pop cx 
	loop boarder555
	mov [yBoarders],0
	mov [xBoarders], 210
	mov cx, 200
	boarder222:
		push cx
		mov bh,0h
		mov cx,[xBoarders]
		mov dx,[yBoarders]
		mov al, 25
		mov ah,0ch
		int 10h
		inc [yBoarders]
		pop cx 
	loop boarder222
	mov [yBoarders],0
	mov [xBoarders], 110 
	
ret
endp deleteBoarders

proc printPerson

	push [xPerson]
	add [xPerson], 1
	mov cx, 34
	person11:
		mov [yPerson], 130
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person11
	sub [xPerson], 35
	
	add [xPerson], 1
	mov cx, 34
	person12:
		mov [yPerson], 129
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person12
	sub [xPerson], 35
	
	add [xPerson], 2
	mov cx, 32
	person13:
		mov [yPerson], 128
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person13
	sub [xPerson], 34
	
	add [xPerson], 2
	mov cx, 32
	person14:
		mov [yPerson], 127
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person14
	sub [xPerson], 34
	
	add [xPerson], 4
	mov cx, 28
	person15:
		mov [yPerson], 126
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person15
	sub [xPerson], 32
	
	add [xPerson], 6
	mov cx, 24
	person16:
		mov [yPerson], 125
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person16
	sub [xPerson], 30
	
	add [xPerson], 1
	mov cx, 34
	person17:
		mov [yPerson], 190
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person17
	sub [xPerson], 35
	
	add [xPerson], 1
	mov cx, 34
	person18:
		mov [yPerson], 191
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person18
	sub [xPerson], 35
	
	add [xPerson], 2
	mov cx, 32
	person21:
		mov [yPerson], 192
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person21
	sub [xPerson], 34
	
	add [xPerson], 2
	mov cx, 32
	person22:
		mov [yPerson], 193
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person22
	sub [xPerson], 34
	
	add [xPerson], 4
	mov cx, 28
	person23:
		mov [yPerson], 194
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person23
	sub [xPerson], 32
	
	add [xPerson], 6
	mov cx, 24
	person24:
		mov [yPerson], 195
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 14
		mov ah,0ch
		int 10h
		inc [xPerson]
		pop cx 
	loop person24
	sub [xPerson], 30
	
	mov cx, 3
	person:
		mov [yPerson], 131
		push cx
		mov cx, 59
		heigth:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 14
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth
		inc [xPerson]
		pop cx 
	loop person
	mov cx, 30
	person2:
		mov [yPerson], 131
		push cx
		mov cx, 5
		heigth2:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 14
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth2
		inc [xPerson]
		pop cx 
	loop person2
	mov cx, 3
	person3:
		mov [yPerson], 131
		push cx
		mov cx, 59
		heigth3:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 14
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth3
		inc [xPerson]
		pop cx 
	loop person3 
	sub [xPerson], 33
	mov cx, 30
	person4:
		mov [yPerson], 184
		push cx
		mov cx, 6
		heigth4:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 14
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth4
		inc [xPerson]
		pop cx 
	loop person4
	sub [xPerson], 30
	mov cx, 30
	person5:
		mov [yPerson], 136
		push cx
		mov cx, 2
		heigth5:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth5
		inc [xPerson]
		pop cx 
	loop person5
	sub [xPerson], 29
	mov cx, 28
	person8:
		mov [yPerson], 138
		push cx
		mov cx, 2
		heigth8:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth8
		inc [xPerson]
		pop cx 
	loop person8
	sub [xPerson], 27
	mov cx, 26
	person19:
		mov [yPerson], 140
		push cx
		mov cx, 2
		heigth19:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth19
		inc [xPerson]
		pop cx 
	loop person19
	sub [xPerson], 25
	mov cx, 24
	person29:
		mov [yPerson], 142
		push cx
		mov cx, 2
		heigth29:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth29
		inc [xPerson]
		pop cx 
	loop person29
	sub [xPerson], 23
	mov cx, 22
	person39:
		mov [yPerson], 144
		push cx
		mov cx, 2
		heigth39:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth39
		inc [xPerson]
		pop cx 
	loop person39
	sub [xPerson], 21
	mov cx, 20
	person49:
		mov [yPerson], 146
		push cx
		mov cx, 2
		heigth49:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth49
		inc [xPerson]
		pop cx 
	loop person49
	sub [xPerson], 19
	mov cx, 18
	person59:
		mov [yPerson], 148
		push cx
		mov cx, 2
		heigth59:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth59
		inc [xPerson]
		pop cx 
	loop person59
	sub [xPerson], 18
	mov cx, 18
	person69:
		mov [yPerson], 150
		push cx
		mov cx, 24
		heigth69:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 14
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth69
		inc [xPerson]
		pop cx 
	loop person69
	sub [xPerson], 20
	mov cx, 22
	person189:
		mov [yPerson], 174
		push cx
		mov cx, 2
		heigth189:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth189
		inc [xPerson]
		pop cx 
	loop person189	
	sub [xPerson], 23
	mov cx, 24
	person99:
		mov [yPerson], 176
		push cx
		mov cx, 2
		heigth99:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth99
		inc [xPerson]
		pop cx 
	loop person99
	sub [xPerson], 25
	mov cx, 26
	person119:
		mov [yPerson], 178
		push cx
		mov cx, 2
		heigth119:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth119
		inc [xPerson]
		pop cx 
	loop person119
	sub [xPerson], 27
	mov cx, 28
	person108:
		mov [yPerson], 180
		push cx
		mov cx, 2
		heigth108:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth108
		inc [xPerson]
		pop cx 
	loop person108
	sub [xPerson], 29
	mov cx, 30
	person105:
		mov [yPerson], 182
		push cx
		mov cx, 2
		heigth105:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 0
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth105
		inc [xPerson]
		pop cx 
	loop person105
	
	pop [xPerson]
	push [xPerson]
	mov [yPerson], 140
	add [xPerson], 3
	
	mov cx, 40
	car1:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car1
	
	inc [xPerson]
	sub [yPerson], 38
	mov cx, 36
	car2:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car2
	
	inc [xPerson]
	sub [yPerson], 34
	mov cx, 32
	car3:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car3
	
	inc [xPerson]
	sub [yPerson], 30
	mov cx, 28
	car4:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car4
	
	inc [xPerson]
	sub [yPerson], 26
	mov cx, 24
	car5:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car5
	
	inc [xPerson]
	sub [yPerson], 22
	mov cx, 20
	car6:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car6
	
	add [xPerson], 24
	mov [yPerson], 140
	mov cx, 40
	car7:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car7
	
	dec [xPerson]
	sub [yPerson], 38
	mov cx, 36
	car8:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car8
	
	dec [xPerson]
	sub [yPerson], 34
	mov cx, 32
	car9:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car9
	
	dec [xPerson]
	sub [yPerson], 30
	mov cx, 28
	car10:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car10
	
	dec [xPerson]
	sub [yPerson], 26
	mov cx, 24
	car11:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car11
	
	dec [xPerson]
	sub [yPerson], 22
	mov cx, 20
	car12:
		push cx
		mov bh,0h
		mov cx,[xPerson]
		mov dx,[yPerson]
		mov al, 20
		mov ah,0ch
		int 10h
		inc [yPerson]
		pop cx
	loop car12
	
	pop [xPerson]
	
ret
endp printPerson

proc deletePerson

	push [xPerson]
	mov cx, 36
	person25:
		mov [yPerson], 125
		push cx
		mov cx, 71
		heigth25:
			push cx
			mov bh,0h
			mov cx,[xPerson]
			mov dx,[yPerson]
			mov al, 25
			mov ah,0ch
			int 10h
			inc [yPerson]
			pop cx
		loop heigth25
		pop cx 
		inc [xPerson]
	loop person25
	pop [xPerson]
	
ret
endp deletePerson

proc printObstacle

	mov [cCone], 0
	push [xObstacle]
	push [yObstacle]
	
	conee:

		push [xObstacle]
		push [yObstacle]

		add [xObstacle], 8
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 3
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 3
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 3
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 5
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 7
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 7
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 7
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 9
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 13
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,15 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,12 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 17
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 19
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 17
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 12 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 13
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 42 
		mov ah,0ch
		int 10h

		
		pop [yObstacle]
		pop [xObstacle]
		inc [cCone]
	
		cone:
			cmp [cCone], 3
			je endCone
			add [xObstacle], 21
			jmp conee

	endCone:
		mov [cCone], 0
		pop [yObstacle]
		pop [xObstacle]
	
		
ret 
endp printObstacle

proc deleteObstacle
		
		mov [cCone], 0
		push [xObstacle]
		push [yObstacle]
	
	conee2:
		push [xObstacle]
		push [yObstacle]
		
		add [xObstacle], 8
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 3
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 3
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 3
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 5
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 7
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 7
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 7
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 9
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 13
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al,25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 17
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 19
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 17
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 15
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 13
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [yObstacle]
		sub [xObstacle], 11
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h 

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h

		inc [xObstacle]
		mov bh,0h
		mov cx,[xObstacle]
		mov dx,[yObstacle]
		mov al, 25 
		mov ah,0ch
		int 10h
		
		pop [yObstacle]
		pop [xObstacle]
		inc [cCone]
	
	cone2:
		cmp [cCone], 3
		je endCone2
		add [xObstacle], 21
		jmp conee2

	endCone2:
	mov [cCone], 0
	pop [yObstacle]
	pop [xObstacle]
	
ret 
endp deleteObstacle

proc sleep

	mov cx, [cSleep]
	sleepLoop: 
			nop
	loop sleepLoop
	
ret 
endp sleep

proc random 

	startRandom:
		mov ax, 40h
		mov es, ax
		mov ax, es:6Ch
		and al, 00000011b

		cmp al, 0
		je startRandom

		cmp al, 1
		je right

		cmp al, 2
		je middle

		cmp al, 3
		je left

	right:
		mov [xObstacle], 226
		jmp endRandom

	middle:
		mov [xObstacle], 129
		jmp endRandom

	left: 
		mov [xObstacle], 32
		jmp endRandom

	endRandom:
	
ret
endp random 

proc OpenFile

	; Open file
	mov ah, 3Dh
	xor al, al
	mov dx, offset filename
	int 21h
	jc openerror
	mov [filehandle], ax
	ret
	openerror:
		mov dx, offset ErrorMsg
		mov ah, 9h
		int 21h
		
ret
endp OpenFile

proc ReadHeader

	; Read BMP file header, 54 bytes
	mov ah,3fh
	mov bx, [filehandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	
ret
endp ReadHeader

proc ReadPalette

	; Read BMP file color palette, 256 colors * 4 bytes (400h)
	mov ah,3fh
	mov cx,400h
	mov dx,offset Palette
	int 21h
	
ret
endp ReadPalette

proc CopyPal

	; Copy the colors palette to the video memory registers
	; The number of the first color should be sent to port 3C8h
	; The palette is sent to port 3C9h
	mov si,offset Palette
	mov cx,256
	mov dx,3C8h
	mov al,0
	; Copy starting color to port 3C8h
	out dx,al
	; Copy palette itself to port 3C9h
	inc dx
	PalLoop:
		; Note: Colors in a BMP file are saved as BGR values rather than RGB.
		mov al,[si+2] ; Get red value.
		shr al,2 ; Max. is 255, but video palette maximal
		 ; value is 63. Therefore dividing by 4.
		out dx,al ; Send it.
		mov al,[si+1] ; Get green value.
		shr al,2
		out dx,al ; Send it.
		mov al,[si] ; Get blue value.
		shr al,2
		out dx,al ; Send it.
		add si,4 ; Point to next color.
		 ; (There is a null chr. after every color.)
	 loop PalLoop
	
ret
endp CopyPal

proc CopyBitmap

	; BMP graphics are saved upside-down.
	; Read the graphic line by line (200 lines in VGA format),
	; displaying the lines from bottom to top.
	mov ax, 0A000h
	mov es, ax
	mov cx,200
	PrintBMPLoop:
		push cx
		; di = cx*320, point to the correct screen line
		mov di,cx
		shl cx,6
		shl di,8
		add di,cx
		; Read one line
		mov ah,3fh
		mov cx,320
		mov dx,offset ScrLine
		int 21h
		; Copy one line into video memory
		cld ; Clear direction flag, for movsb
		mov cx,320
		mov si,offset ScrLine
		rep movsb ; Copy line to the screen
		 ;rep movsb is same as the following code:
		 ;mov es:di, ds:si
		 ;inc si
		 ;inc di
		 ;dec cx
		;loop until cx=0
		pop cx
	loop PrintBMPLoop
	
ret
endp CopyBitmap


start:
	mov ax, @data
	mov ds, ax
; --------------------------

; Enter graphics mode
	mov ax, 13h 
	int 10h

; Process BMP file
	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	
; Wait for key press
	mov ah, 1
	int 21h

; Back to text mode
	mov ah, 0
	mov al, 2
	int 10h	

; Enter graphics mode again
	mov ax, 13h 
	int 10h
	
	mov [filename], 'o'
	
; Process BMP file
	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	
; Wait for key press
entry:
	mov ah, 00h
	int 16h
	cmp al, 13          ; Check if Enter key is pressed
	jne entry          ; Continue waiting if not Enter
	
	mov [filename], 'd'
	
; Process BMP file
	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	
; Wait for key press
entry1:
	mov ah, 00h
	int 16h
	cmp al, 32         ; Check if Space key is pressed
	jne entry2
	jmp sof            ; Jump to end if Space is pressed
entry2:
	cmp al, 13
	je starting        ; If Enter is pressed, continue
	jmp entry1
	
starting:

; Back to text mode
	mov ah, 0
	mov al, 2
	int 10h	

; Enter graphics mode
	mov ax, 13h 
	int 10h

; Initialize all variables
	mov [score], 0
	mov [cSleep], 25000
	mov [yObstacle], 0
	mov [xPerson], 142
	
; Draw background and shapes
	call background
	call ground
	call boarders
	call random
	call printPerson

; Main game loop
mainLable:

	; Draw the obstacle
	call printObstacle
	; Draw the player
	call printPerson
	; Display the score
	mov dx, offset msg3
	mov ah, 9h
	int 21h
	mov ah, 2
	push [score]
	call printnum
	; Wait for a few milliseconds
	call sleep 

	; Read keyboard input
	in al, 60h 

	; If the right arrow is pressed, jump to move right
	cmp al, 4Dh
	je moveRight

	; If the left arrow is pressed, jump to move left
	cmp al, 4Bh 
	je moveLeft

	; If the space bar is pressed, exit the game
	cmp al, 39h
	jne con3 
	jmp sof

con3:
	; If no conditions are met, jump to print the player
	jmp PrintThePerson

moveRight: ; Move player right
		cmp [xPerson], 260 
		ja PrintThePerson
		; Erase the player
		call deletePerson
		; Move player 10 pixels to the right
		add [xPerson], 10
		; Jump to print the player 
		jmp PrintThePerson

moveLeft: ; Move player left
		cmp [xPerson], 30 
		jb PrintThePerson
		; Erase the player
		call deletePerson
		; Move player 10 pixels to the left
		sub [xPerson], 10
		; Jump to print the player 
		jmp PrintThePerson

PrintThePerson: ; Print the player

		cmp [yObstacle], 175 ; Check if the obstacles reached the bottom of the screen
		jne con1

		call deleteObstacle ; Erase the obstacles
		add [score], 5      ; Increase the score by five
		sub [cSleep], 100   ; Increase speed
		call random         ; Insert random value into xObstacle
		mov [yObstacle], 0  ; Reset the height of the obstacles

con1: 

		cmp [yObstacle], 100 ; Check if obstacles reached the height of collision
		jb con2 

		; Get the right edge of the obstacles
		mov ax, [xObstacle]
		add ax, 62 

		; Check if the right edge of the obstacles is less than the left edge of the player
		cmp ax, [xPerson]
		jb con2 

		; Get the left edge of the obstacles
		sub ax, 62
		; Get the right edge of the player 
		mov bx, [xPerson]
		add bx, 36 

		; Check if the left edge of the obstacles is greater than the right edge of the player
		cmp ax, bx
		ja con2
		
		; If the conditions above are not met, a collision occurred and the game is over
		jmp over

con2:
	call deleteObstacle ; Erase the obstacles
	add [yObstacle], 5  ; Move obstacles down by 5
	call deleteBoarders ; Erase the borders
	
	; Draw borders according to game round
	cmp [cGame], 0
	jne con5
		
	call boarders2
	mov [cGame], 1
	jmp con4
	
con5:
	call boarders
	mov [cGame], 0
		
con4:	
	; Erase the score
	mov cx, 30
	deleteScore:
		mov dl, 8
		mov ah, 2h
		int 21h
	loop deleteScore
	
	; Jump back to the main loop
	jmp mainLable

over: 
	
	; Back to text mode
	mov ah, 0
	mov al, 2
	int 10h

	; Enter graphics mode
	mov ax, 13h 
	int 10h

	mov dx, offset msg2
	mov ah, 9h
	int 21h
	mov ah, 2
	mov dl, 10
	int 21h
	mov dl, 13
	int 21h
	
	; Print the score
	mov dx, offset msg3
	mov ah, 9h
	int 21h
	mov ah, 2
	push [score]
	call printnum
	
	mov ah, 2h
	mov dl, 10
	int 21h
	mov dl, 13
	int 21h
	
	mov dx, offset msg4
	mov ah, 9h
	int 21h
	mov ah, 2
	mov dl, 10
	int 21h
	mov dl, 13
	int 21h
	
	mov dx, offset msg5
	mov ah, 9h
	int 21h
	mov ah, 2
	mov dl, 10
	int 21h
	mov dl, 13
	int 21h
	
	; Clear keyboard buffer
	mov ah, 0Ch
	mov al, 0
	int 21h
		
	mov ah, 00h
	int 16h
	cmp al, 13
	jne sof
		
	jmp starting
	
sof:
	cmp al, 32
	je ending
	jmp over
	
ending:

	; Back to text mode
	mov ah, 0
	mov al, 2
	int 10h

; --------------------------
	
exit:
	mov ax, 4C00h
	int 21h
END start
