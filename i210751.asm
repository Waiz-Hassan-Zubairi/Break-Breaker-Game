.model small
.stack 100h

.data
msg db 'HELLO'
msg1 db '"We are FASTIANS"'
msg2 db 'Develepors  : Waiz & Tuba'
msg3 db 'We both are doing CS from FAST'
msg4 db 'Contact_no : 03201713676'
msg5 db 'Email IDs'
msg6 db 'i210751@nu.edu/i210861@nu.edu.pk'
paused db 'PAUSED'

msgs db 'INSTRUCTION'
msgs1 db 'move the PADDLE from side-to-side '
msgs2 db 'to hit a BALL'
msgs3 db 'you must eliminate all the BRICKS'
msgs4 db 'if the ball hits the bottom'
msgs5 db 'the player loses the game'
msgs6 db 'BEST OF LUCK'

mg1 db 'YOU WON'
mg2 db 'CONGRATS !!!'


Level_display1 db ' Level 1 '
Level_display2 db ' Level 2 '
Level_display3 db ' Level 3 '
Level_counter db 1
Enter_Name db 'Enter Your Name : '
array dw 10 dup(0)

falling_Piece_Counter db 0
falling_Piece_X1 db 0
falling_Piece_X2 db 0
falling_Piece_Y1 db 0
falling_Piece_Y2 db 0

file db "myfile.txt",0
Filehandler dw ?
buffer db 5000 dup("$")
arr_space db "      ","$" 
arr_level db "Level : ","$" 
arr_score db "Score : ","$" 
arr_level_store db 5 dup ("$")
save_level db 100 dup ("$")
save_score db 100 dup ("$")

counter db 0

score dw 0
digitCount db 0 

mover dw ?;305 ;; for ball moving
mover2 dw ?;185	;; for ball moving

Heart_Counter dw 0
Start_min db 0
min db 0
;mover_bar db 1  ;23 left column
;mover2_bar db 6   ;38	right column
 
block1_x1 dw 14
block1_x2 dw 55
block1_y1 dw 22
block1_y2 dw 32

block2_x1 dw 64
block2_x2 dw 105
block2_y1 dw 22
block2_y2 dw 32

block3_x1 dw 114
block3_x2 dw 155
block3_y1 dw 22
block3_y2 dw 32

block4_x1 dw 164
block4_x2 dw 205
block4_y1 dw 22
block4_y2 dw 32

block5_x1 dw 214
block5_x2 dw 255
block5_y1 dw 22
block5_y2 dw 32

block6_x1 dw 264
block6_x2 dw 305
block6_y1 dw 22
block6_y2 dw 32

block7_x1 dw 14
block7_x2 dw 55
block7_y1 dw 37
block7_y2 dw 47

block8_x1 dw 64
block8_x2 dw 105
block8_y1 dw 37
block8_y2 dw 47

block9_x1 dw 114
block9_x2 dw 155
block9_y1 dw 37
block9_y2 dw 47

block10_x1 dw 164
block10_x2 dw 205
block10_y1 dw 37
block10_y2 dw 47

block11_x1 dw 214
block11_x2 dw 255
block11_y1 dw 37
block11_y2 dw 47

block12_x1 dw 264
block12_x2 dw 305
block12_y1 dw 37
block12_y2 dw 47

X1 dw 100
X2 dw 200
Y1 dw 182
Y2 dw 192
X1_Helper1 dw 130
X1_Helper2 dw 169
X1_Helper3 dw 200

X1_remove dw 36
X2_remove dw 38
Y1_remove dw 4
Y2_Remove dw 5

pointer_X db 7
pointer_Y db 51




remove1_counter dw 1
remove2_counter dw 1
remove3_counter dw 1
remove4_counter dw 1
remove5_counter dw 1
remove6_counter dw 1
remove7_counter dw 1
remove8_counter dw 1
remove9_counter dw 1
remove10_counter dw 1
remove11_counter dw 1
remove12_counter dw 1



.code

mov ax,@data
mov ds,ax
mov ax,0

;/////////////////////////////////
;////////////////////////////////
;///////Creating File //////////
;//////////////////////////////
;/////////////////////////////

mov ah, 3CH ;service to create a file
mov cl, 2 ; 0 readonly, 1 hidden & 2 system file
mov dx, offset file
int 21h

;/////////////////////////////////
;////////////////////////////////
;///////Creating File //////////
;//////////////////////////////
;/////////////////////////////


mov al,13h
int 10h
;//////////////////////////////////
;/////////////////////////////////
;////////// MENU ////////////////
;///////////////////////////////
;//////////////////////////////
Menu:
mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah, 6
mov al, 0
mov bh, 4    ;color
mov ch, 0    ;top row of window
mov cl, 0     ;left most column of window
mov dh, 50     ;Bottom row of window
mov dl, 50    ;Right most column of window
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 0      ; black color
mov ch, 1    ;top row of window
mov cl, 1    ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38     ;Right most column of window
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


;//////////////////desinging/////////////////////

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 6    ;color
mov ch, 10    ;top row of window
mov cl, 25    ;left most column of window
mov dh, 22     ;Bottom row of window
mov dl, 37    ;Right most column of window
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 7      ; light gray color
mov ch, 15    ;top row of window
mov cl, 27    ;left most column of window
mov dh, 18     ;Bottom row of window
mov dl, 34     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 8      ; dark gray color
mov ch, 16    ;top row of window
mov cl, 28    ;left most column of window
mov dh, 17     ;Bottom row of window
mov dl, 33     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 7      ; light gray color
mov ch, 17    ;top row of window
mov cl, 31    ;left most column of window
mov dh, 19     ;Bottom row of window
mov dl, 35     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 8      ; dark gray color
mov ch, 17    ;top row of window
mov cl, 32    ;left most column of window
mov dh, 18     ;Bottom row of window
mov dl, 34     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 7      ; light gray color
mov ch, 14    ;top row of window
mov cl, 28    ;left most column of window
mov dh, 15     ;Bottom row of window
mov dl, 30     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 8      ; dark gray color
mov ch, 15    ;top row of window
mov cl, 28    ;left most column of window
mov dh, 16     ;Bottom row of window
mov dl, 29     ;Right most column of window
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



;*words*
;/////////////////brick breaker///////////////////////
;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 52     ;column
int 10h

mov al,'B'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 53     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,15    ;color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 54     ;column
int 10h

mov al,'I'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 55     ;column
int 10h

mov al,'C'    ;ASCII code of Character 
mov bx,0
mov bl,15   ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 56     ;column
int 10h

mov al,'K'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 58     ;column
int 10h

mov al,'B'    ;ASCII code of Character 
mov bx,0
mov bl,15       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 59     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 60     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 61     ;column
int 10h

mov al,'A'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 62     ;column
int 10h

mov al,'K'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 63     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 3     ;row
mov dl, 64     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,15      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

;//////////////////new game///////////////
;setting cursor position
mov ah, 2
mov dh, 7     ;row
mov dl, 54     ;column
int 10h

mov al,'N'    ;ASCII code of Character 
mov bx,0
mov bl,4      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 7     ;row
mov dl, 55     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4    ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 7     ;row
mov dl, 56     ;column
int 10h

mov al,'W'    ;ASCII code of Character 
mov bx,0
mov bl,4      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 7     ;row
mov dl, 58     ;column
int 10h

mov al,'G'    ;ASCII code of Character 
mov bx,0
mov bl,4   ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 7     ;row
mov dl, 59     ;column
int 10h

mov al,'A'    ;ASCII code of Character 
mov bx,0
mov bl,4      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 7     ;row
mov dl, 60     ;column
int 10h

mov al,'M'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 7     ;row
mov dl, 61     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

;//////////////////instructions/////////////////

mov ah, 2
mov dh, 10     ;row
mov dl, 56     ;column
int 10h

mov al,'H'    ;ASCII code of Character 
mov bx,0
mov bl,4    ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 10    ;row
mov dl, 57     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4     ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 10     ;row
mov dl, 58     ;column
int 10h

mov al,'L'    ;ASCII code of Character 
mov bx,0
mov bl,4      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ah, 2
mov dh, 10     ;row
mov dl, 59     ;column
int 10h

mov al,'P'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

;//////////////////Score/////////////////

mov ah, 2
mov dh, 13     ;row
mov dl, 55     ;column
int 10h

mov al,'S'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 13     ;row
mov dl, 56     ;column
int 10h

mov al,'C'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 13     ;row
mov dl, 57     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,4        ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ah, 2
mov dh, 13     ;row
mov dl, 58     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,4        ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 13     ;row
mov dl, 59     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 13     ;row
mov dl, 60     ;column
int 10h

mov al,'S'    ;ASCII code of Character 
mov bx,0
mov bl,4      ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

;////////////////////////////////about us////////////////////
;setting cursor position
mov ah, 2
mov dh, 16     ;row
mov dl, 54     ;column
int 10h

mov al,'A'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 16     ;row
mov dl, 55     ;column
int 10h

mov al,'B'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 16     ;row
mov dl, 56     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,4          ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 16     ;row
mov dl, 57     ;column
int 10h

mov al,'U'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 16     ;row
mov dl, 58     ;column
int 10h

mov al,'T'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 16     ;row
mov dl, 60     ;column
int 10h

mov al,'U'    ;ASCII code of Character 
mov bx,0
mov bl,4          ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 16     ;row
mov dl, 61     ;column
int 10h

mov al,'S'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

;//////////////////////quit///////////////////////////
mov ah, 2
mov dh, 19     ;row
mov dl, 56     ;column
int 10h

mov al,'Q'    ;ASCII code of Character 
mov bx,0
mov bl,4         ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 19     ;row
mov dl, 57     ;column
int 10h

mov al,'U'    ;ASCII code of Character 
mov bx,0
mov bl,4        ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov ah, 2
mov dh, 19     ;row
mov dl, 58     ;column
int 10h

mov al,'I'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov ah, 2
mov dh, 19     ;row
mov dl, 59     ;column
int 10h

mov al,'T'    ;ASCII code of Character 
mov bx,0
mov bl,4       ;black color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;**pointer*
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0



;*boxes**
MOV CX, 105    ;(column)
MOV DX, 50    ;(row)
ll1:
cmp cx, 180
je ll2
MOV AL, 15  ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp ll1

ll2:
MOV CX, 105    ;(column)
MOV DX, 70    ;(row)
ll3:
cmp cx, 180
je ll4
MOV AL, 15  ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp ll3

ll4:
MOV CX, 105    ;(column)
MOV DX, 70   ;(row)
ll5:
cmp dx, 50
je ll6
MOV AL, 15  ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp ll5

ll6:
MOV CX, 180    ;(column)
MOV DX, 70    ;(row)
ll7:
cmp dx, 50
je ll8
MOV AL, 15  ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp ll7
;//////////////next/////////////////
ll8:
MOV AX, 0
Mov Bx, 0
MOV CX, 105    ;(column)
MOV DX, 75   ;(row)
ll9:
cmp cx, 180
je ll10
MOV AL, 15  ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp ll9

ll10:
MOV CX, 105    ;(column)
MOV DX, 95    ;(row)
ll11:
cmp cx, 180
je ll12
MOV AL, 15   ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp ll11

ll12:
MOV CX, 105    ;(column)
MOV DX, 95   ;(row)
ll13:
cmp dx, 75
je ll14
MOV AL, 15  ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp ll13

ll14:
MOV CX, 180    ;(column)
MOV DX, 95     ;(row)
ll15:
cmp dx, 75
je ll16
MOV AL, 15    ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp ll15

;////////////////next/////////////////
ll16:
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

MOV AX, 0
Mov Bx, 0
MOV CX, 105    ;(column)
MOV DX, 100    ;(row)
llA:
cmp cx, 180
je llB
MOV AL, 15       ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp llA

llB:
MOV CX, 105    ;(column)
MOV DX, 118    ;(row)
llC:
cmp cx, 180
je llD
MOV AL, 15       ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp llC

llD:
MOV CX, 105    ;(column)
MOV DX, 118    ;(row)
ll_e:
cmp dx, 100
je lf
MOV AL, 15      ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp ll_e

lf:
MOV CX, 180    ;(column)
MOV DX, 118     ;(row)
lg:
cmp dx, 100
je lh
MOV AL, 15      ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp lg

;/////////////////////next///////////////////
lh:
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

MOV CX, 105    ;(column)
MOV DX, 123    ;(row)
li:
cmp cx, 180
je lj
MOV AL, 15       ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp li

lj:
MOV CX, 105    ;(column)
MOV DX, 141    ;(row)
lk:
cmp cx, 180
je ll
MOV AL, 15         ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp lk

ll:
MOV CX, 105    ;(column)
MOV DX, 141    ;(row)
lm:
cmp dx, 123
je ln
MOV AL, 15          ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp lm

ln:
MOV CX, 180    ;(column)
MOV DX, 141    ;(row)
lo:
cmp dx, 123
je lp
MOV AL, 15       ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp lo

;////////////////////next//////////////////
lp:
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

MOV CX, 105    ;(column)
MOV DX, 145    ;(row)
lQ:
cmp cx, 180
je lR
MOV AL, 15       ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp lQ

lR:
MOV CX, 105    ;(column)
MOV DX, 165    ;(row)
lS:
cmp cx, 180
je l_T
MOV AL, 15           ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp lS

l_T:
MOV CX, 105    ;(column)
MOV DX, 165    ;(row)
lU:
cmp dx, 145
je lV
MOV AL, 15             ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp lU

lV:
MOV CX, 180    ;(column)
MOV DX, 165     ;(row)
lX:
cmp dx, 145
je lY
MOV AL, 15         ;black color
MOV AH, 0CH 
INT 10H
dec dx
jmp lX

;********desinging*******
;//////////Bricks///////////

lY:
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

lAA8:
MOV CX, 200    ;(column)
MOV DX, 95    ;(row)
lBB8:
cmp cx, 304
je lCC8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc cx
jmp lBB8

lCC8:
MOV CX, 200    ;(column)
MOV DX, 110    ;(row)
lDD8:
cmp cx, 304
je lEE8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc cx
jmp lDD8

lEE8:
MOV CX, 200    ;(column)
MOV DX, 125    ;(row)
lFF8:
cmp cx, 304
je lGG8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc cx
jmp lFF8

lGG8:
MOV CX, 200    ;(column)
MOV DX, 140    ;(row)
lHH8:
cmp cx, 304
je lII8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc cx
jmp lHH8

lII8:
MOV CX, 200    ;(column)
MOV DX, 155    ;(row)
lJJ8:
cmp cx, 304
je lKK8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc cx
jmp lJJ8

lKK8:
MOV CX, 200    ;(column)
MOV DX, 170    ;(row)
lLL8:
cmp cx, 304
je lMM8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc cx
jmp lLL8

lMM8:
MOV CX, 240    ;(column)
MOV DX, 95    ;(row)
lNN8:
cmp dx, 110 
je lOO8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lNN8

loo8:
MOV CX, 220    ;(column)
MOV DX, 80    ;(row)
lPP8:
cmp dx, 95 
je lQQ8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lPP8

lQQ8:
MOV CX, 260    ;(column)
MOV DX, 80    ;(row)
lRR8:
cmp dx, 95 
je lSS8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lRR8

lSS8:
MOV CX, 280    ;(column)
MOV DX, 95    ;(row)
lTT8:
cmp dx, 110 
je lUU8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lTT8

lUU8:
MOV CX, 220    ;(column)
MOV DX, 110    ;(row)
lVV8:
cmp dx, 125 
je lWW8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lVV8

lWW8:
MOV CX, 300    ;(column)
MOV DX, 80    ;(row)
lXX8:
cmp dx, 95 
je lYY8
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lXX8

lYY8:
MOV CX, 260    ;(column)
MOV DX, 110    ;(row)
lZZ8:
cmp dx, 125 
je lAA9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lZZ8

lAA9:
MOV CX, 300    ;(column)
MOV DX, 110    ;(row)
lBB9:
cmp dx, 125 
je lCC9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lBB9

lCC9:
MOV CX, 240    ;(column)
MOV DX, 125    ;(row)
lDD9:
cmp dx, 140 
je lEE9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lDD9

lEE9:
MOV CX, 280    ;(column)
MOV DX, 125    ;(row)
lFF9:
cmp dx, 140 
je lGG9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lFF9

lGG9:
MOV CX, 240    ;(column)
MOV DX, 155    ;(row)
lHH9:
cmp dx, 170 
je lII9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lHH9

lII9:
MOV CX, 280    ;(column)
MOV DX, 155    ;(row)
lJJ9:
cmp dx, 170 
je lKK9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lJJ9

lKK9:
MOV CX, 220    ;(column)
MOV DX, 140    ;(row)
lLL9:
cmp dx, 155
je lMM9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lLL9

lMM9:
MOV CX, 260    ;(column)
MOV DX, 140    ;(row)
lNN9:
cmp dx, 155
je lOO9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lNN9

lOO9:
MOV CX, 300    ;(column)
MOV DX, 140    ;(row)
lPP9:
cmp dx, 155
je lQQ9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lPP9

lQQ9:
MOV CX, 220    ;(column)
MOV DX, 170    ;(row)
lRR9:
cmp dx, 184
je lSS9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lRR9

lSS9:
MOV CX, 260    ;(column)
MOV DX, 170    ;(row)
lTT9:
cmp dx, 184
je lUU9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lTT9

lUU9:
MOV CX, 300    ;(column)
MOV DX, 170    ;(row)
lVV9:
cmp dx, 184
je lWW9
MOV AL, 15             ;white color
MOV AH, 0CH 
INT 10H
inc dx
jmp lVV9

lWW9:
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0


;////////////////ball//////////
lXX9:
MOV CX, 232    ;(column)
MOV DX, 143    ;(row)
lYY9:
cmp cx, 268
je lZZ9
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lYY9

lZZ9:
MOV CX, 231    ;(column)
MOV DX, 142    ;(row)
lAA7:
cmp cx, 269
je lBB7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lAA7

lBB7:
MOV CX, 230    ;(column)
MOV DX, 141    ;(row)
lCC7:
cmp cx, 270
je lDD7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lCC7

lDD7:
MOV CX, 230    ;(column)
MOV DX, 140    ;(row)
lEE7:
cmp cx, 270
je lFF7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lEE7

lFF7:
MOV CX, 230    ;(column)
MOV DX, 139    ;(row)
lGG7:
cmp cx, 270
je lHH7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lGG7

lHH7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 138    ;(row)
lII7:
cmp cx, 270           ;increase
je lJJ07
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lII7

lJJ07:
MOV CX, 233    ;(column) ....... decrease
MOV DX, 144    ;(row)
lII07:
cmp cx, 267           ;increase
je lKK07
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lII07

lKK07:
MOV CX, 234    ;(column) ....... decrease
MOV DX, 145    ;(row)
lLL07:
cmp cx, 266           ;increase
je lMM07
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lLL07

lMM07:
MOV CX, 235    ;(column) ....... decrease
MOV DX, 125    ;(row)
lNN07:
cmp cx, 265           ;increase
je lJJ7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lNN07

lJJ7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 137    ;(row)
lKK7:
cmp cx, 270           ;increase
je lLL7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lKK7

lLL7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 136    ;(row)
lMM7:
cmp cx, 270           ;increase
je lNN7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lMM7

lNN7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 135    ;(row)
lOO7:
cmp cx, 270           ;increase
je lPP7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lOO7

lPP7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 134    ;(row)
lQQ7:
cmp cx, 270           ;increase
je lRR7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lQQ7

lRR7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 133    ;(row)
lSS7:
cmp cx, 270           ;increase
je lTT7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lSS7

lTT7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 132    ;(row)
lUU7:
cmp cx, 270           ;increase
je lVV7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lUU7

lVV7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 131    ;(row)
lWW7:
cmp cx, 270           ;increase
je lXX7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lWW7

lXX7:
MOV CX, 230    ;(column) ....... decrease
MOV DX, 130    ;(row)
lYY7:
cmp cx, 270           ;increase
je lZZ7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lYY7

lZZ7:
MOV CX, 231    ;(column) ....... decrease
MOV DX, 129    ;(row)
lAAA7:
cmp cx, 270           ;increase
je lBBB7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lAAA7

lBBB7:
MOV CX, 232    ;(column) ....... decrease
MOV DX, 128    ;(row)
lCCC7:
cmp cx, 269           ;increase
je lDDD7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lCCC7

lDDD7:
MOV CX, 233    ;(column) ....... decrease
MOV DX, 127    ;(row)
lEEE7:
cmp cx, 268           ;increase
je lFFF7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lEEE7

lFFF7:
MOV CX, 234    ;(column) ....... decrease
MOV DX, 126    ;(row)
lGGG7:
cmp cx, 267           ;increase
je lHHH7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lGGG7

lHHH7:
MOV CX, 235    ;(column) ....... decrease
MOV DX, 125    ;(row)
lIII7:
cmp cx, 266           ;increase
je lJJJ7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lIII7

lJJJ7:
MOV CX, 236    ;(column) ....... decrease
MOV DX, 124    ;(row)
lKKK7:
cmp cx, 265           ;increase
je lLLL7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lKKK7

lLLL7:
MOV CX, 237    ;(column) ....... increase
MOV DX, 126    ;(row)
lMMM7:
cmp cx, 264           ;decrease
je lNNN7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lMMM7

lNNN7:
MOV CX, 230    ;(column)
MOV DX, 130    ;(row)
lOOO7:
cmp dx, 140
je lPPP7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc dx
jmp lOOO7

lPPP7:
MOV CX, 270    ;(column)
MOV DX, 130    ;(row)
lQQQ7:
cmp dx, 140   
je lRRR7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc dx
jmp lQQQ7

lRRR7:
MOV CX, 270    ;(column)
MOV DX, 140    ;(row)
lSSS7:
cmp dx, 145
cmp cx, 260
je lTTT7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc dx
dec cx
jmp lSSS7

lTTT7:
MOV CX, 270    ;(column)
MOV DX, 130    ;(row)
lUUU7:
cmp dx, 125
cmp cx, 260
je lVVV7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
dec dx
dec cx
jmp lUUU7

lVVV7:
MOV CX, 230    ;(column)
MOV DX, 130    ;(row)
lWWW7:
cmp dx, 125
cmp cx, 240
je lXXX7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
dec  dx
inc  cx
jmp lWWW7

lXXX7:
MOV CX, 230    ;(column)
MOV DX, 140    ;(row)
lYYY7:
cmp dx, 145
cmp cx, 240
je lZZZ7
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc  dx
inc cx
jmp lYYY7

lZZZ7:
MOV CX, 236    ;(column)
MOV DX, 145    ;(row)
lAAA8:
cmp cx, 265
je lBBB8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lAAA8

lBBB8:
MOV CX, 237    ;(column)    inc
MOV DX, 146    ;(row)        inc
lCCC8:
cmp cx, 264           ;dec
je lDDD8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lCCC8

lDDD8:
MOV CX, 238    ;(column)    inc
MOV DX, 147    ;(row)        inc
lEEE8:
cmp cx, 263           ;dec
je lFFF8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lEEE8

lFFF8:
MOV CX, 239    ;(column)    inc
MOV DX, 148    ;(row)        inc
lGGG8:
cmp cx, 262           ;dec
je lHHH8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lGGG8

lHHH8:
MOV CX, 240    ;(column)    inc
MOV DX, 149    ;(row)        inc
lIII8:
cmp cx, 261           ;dec
je lJJJ8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lIII8

lJJJ8:
MOV CX, 238    ;(column)    inc
MOV DX, 125    ;(row)        inc
lKKK8:
cmp cx, 263           ;dec
je lLLL8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lKKK8

lLLL8:
MOV CX, 239    ;(column)    inc
MOV DX, 124    ;(row)        inc
lMMM8:
cmp cx, 262           ;dec
je lNNN8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lMMM8

lNNN8:
MOV CX, 237    ;(column)    inc
MOV DX, 123    ;(row)        inc
lOOO8:
cmp cx, 263           ;dec
je lPPP8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lOOO8

lPPP8:
MOV CX, 238    ;(column)    inc
MOV DX, 122    ;(row)        inc
lQQQ8:
cmp cx, 262           ;dec
je lRRR8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lQQQ8

lRRR8:
MOV CX, 239    ;(column)    inc
MOV DX, 121    ;(row)        inc
lSSS8:
cmp cx, 261           ;dec
je lTTT8
MOV AL, 9             ;light blue color
MOV AH, 0CH 
INT 10H
inc cx
jmp lSSS8

lTTT8:
MOV CX, 210    ;(column)    inc
MOV DX, 144    ;(row)        inc
lUUU8:
cmp cx, 248           ;dec
je lVVV8
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lUUU8

lVVV8:
MOV CX, 210    ;(column)    inc
MOV DX, 145    ;(row)        inc
lWWW8:
cmp cx, 248           ;dec
je lXXX8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lWWW8

lXXX8:
MOV CX, 210    ;(column)    inc
MOV DX, 146    ;(row)        inc
lYYY8:
cmp cx, 248           ;dec
je lZZZ8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lYYY8

lZZZ8:
MOV CX, 210    ;(column)    
MOV DX, 147    ;(row)        
lAAA9:
cmp cx, 248           
je lBBB9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lAAA9

lBBB9:
MOV CX, 210    ;(column)    
MOV DX, 148    ;(row)        
lCCC9:
cmp cx, 248           
je lDDD9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lCCC9

lDDD9:
MOV CX, 210    ;(column)    
MOV DX, 149    ;(row)        
lEEE9:
cmp cx, 248           
je lFFF9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lEEE9

lFFF9:
MOV CX, 210    ;(column)    
MOV DX, 150    ;(row)        
lGGG9:
cmp cx, 248           
je lHHH9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lGGG9

lHHH9:
MOV CX, 210    ;(column)    
MOV DX, 151    ;(row)        
lIII9:
cmp cx, 248           
je lJJJ9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lIII9

lJJJ9:
MOV CX, 210    ;(column)    
MOV DX, 152    ;(row)        
lKKK9:
cmp cx, 248           
je lLLL9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lKKK9

lLLL9:
MOV CX, 210    ;(column)    
MOV DX, 153    ;(row)        
lMMM9:
cmp cx, 248           
je lNNN9
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lMMM9

lNNN9:
MOV CX, 210    ;(column)    
MOV DX, 153    ;(row)        
lOOO9:
cmp dx, 144           
je lPPP9
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
dec dx
jmp lOOO9

lPPP9:
MOV CX, 248    ;(column)    
MOV DX, 144    ;(row)        
lQQQ9:
cmp dx, 153           
je lRRR9
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lQQQ9

lRRR9:
MOV CX, 238    ;(column)    
MOV DX, 124    ;(row)        
lSSS9:
cmp cx, 276           
je lTTT9
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lSSS9

lTTT9:
MOV CX, 238    ;(column)    
MOV DX, 113    ;(row)        
lUUU9:
cmp cx, 276           
je lVVV9
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lUUU9

lVVV9:
MOV CX, 238    ;(column)    
MOV DX, 114    ;(row)        
lWWW9:
cmp cx, 276           
je lXXX9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lWWW9

lXXX9:
MOV CX, 238    ;(column)    
MOV DX, 115    ;(row)        
lYYY9:
cmp cx, 276           
je lZZZ9
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lYYY9

lZZZ9:
MOV CX, 238    ;(column)    
MOV DX, 116    ;(row)        
lAAAA7:
cmp cx, 276           
je lBBBB7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lAAAA7

lBBBB7:
MOV CX, 238    ;(column)    
MOV DX, 117    ;(row)        
lCCCC7:
cmp cx, 276           
je lDDDD7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lCCCC7

lDDDD7:
MOV CX, 238    ;(column)    
MOV DX, 118    ;(row)        
lEEEE7:
cmp cx, 276           
je lFFFF7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lEEEE7

lFFFF7:
MOV CX, 238    ;(column)    
MOV DX, 119    ;(row)        
lGGGG7:
cmp cx, 276           
je lHHHH7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lGGGG7

lHHHH7:
MOV CX, 238    ;(column)    
MOV DX, 120    ;(row)        
lIIII7:
cmp cx, 276           
je lJJJJ7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lIIII7

lJJJJ7:
MOV CX, 238    ;(column)    
MOV DX, 121    ;(row)        
lKKKK7:
cmp cx, 276           
je lLLLL7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lKKKK7

lLLLL7:
MOV CX, 238    ;(column)    
MOV DX, 122    ;(row)        
lMMMM7:
cmp cx, 276           
je lNNNN7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lMMMM7

lNNNN7:
MOV CX, 238    ;(column)    
MOV DX, 123    ;(row)        
lOOOO7:
cmp cx, 276           
je lPPPP7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lOOOO7

lPPPP7:
MOV CX, 238    ;(column)    
MOV DX, 123    ;(row)        
lQQQQ7:
cmp dx, 113           
je lRRRR7
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
dec dx
jmp lQQQQ7

lRRRR7:
MOV CX, 276    ;(column)    
MOV DX, 123    ;(row)        
lSSSS7:
cmp dx, 113           
je lTTTT7
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
dec dx
jmp lSSSS7

lTTTT7:
MOV CX, 295    ;(column)    
MOV DX, 120    ;(row)        
lUUUU7:
cmp dx, 158           
je lVVVV7
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lUUUU7

lVVVV7:
MOV CX, 285    ;(column)    
MOV DX, 120    ;(row)        
lWWWW7:
cmp dx, 158           
je lXXXX7
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lWWWW7

lXXXX7:
MOV CX, 286    ;(column)    
MOV DX, 120    ;(row)        
lYYYY7:
cmp dx, 158           
je lZZZZ7
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lYYYY7

lZZZZ7:
MOV CX, 287    ;(column)    
MOV DX, 120    ;(row)        
lAAAA8:
cmp dx, 158           
je lBBBB8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lAAAA8

lBBBB8:
MOV CX, 288    ;(column)    
MOV DX, 120    ;(row)        
lCCCC8:
cmp dx, 158           
je lDDDD8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lCCCC8

lDDDD8:
MOV CX, 289    ;(column)    
MOV DX, 120    ;(row)        
lEEEE8:
cmp dx, 158           
je lFFFF8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lEEEE8

lFFFF8:
MOV CX, 290    ;(column)    
MOV DX, 120    ;(row)        
lGGGG8:
cmp dx, 158           
je lHHHH8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lGGGG8

lHHHH8:
MOV CX, 291    ;(column)    
MOV DX, 120    ;(row)        
lIIII8:
cmp dx, 158           
je lJJJJ8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lIIII8

lJJJJ8:
MOV CX, 292    ;(column)    
MOV DX, 120    ;(row)        
lKKKK8:
cmp dx, 158           
je lLLLL8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lKKKK8

lLLLL8:
MOV CX, 293    ;(column)    
MOV DX, 120    ;(row)        
lMMMM8:
cmp dx, 158           
je lNNNN8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lMMMM8

lNNNN8:
MOV CX, 294    ;(column)    
MOV DX, 120    ;(row)        
lOOOO8:
cmp dx, 158           
je lPPPP8
MOV AL, 4              ;red 4 color
MOV AH, 0CH 
INT 10H
inc dx
jmp lOOOO8

lPPPP8:
MOV CX, 285    ;(column)    
MOV DX, 120    ;(row)        
lQQQQ8:
cmp cx, 295           
je lRRRR8
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lQQQQ8

lRRRR8:
MOV CX, 285    ;(column)    
MOV DX, 158    ;(row)        
lSSSS8:
cmp cx, 295           
je lTTTT8
MOV AL, 0              ;red 4 color
MOV AH, 0CH 
INT 10H
inc cx
jmp lSSSS8

;////////////////upperdesign/////////////////

lTTTT8:
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 2    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 6     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 12      ; color
mov ch, 2    ;top row of window
mov cl, 6    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 10     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 4    ;top row of window
mov cl, 4    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 8     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 6    ;top row of window
mov cl, 3    ;left most column of window
mov dh, 7     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 3      ; color
mov ch, 8    ;top row of window
mov cl, 6    ;left most column of window
mov dh, 9     ;Bottom row of window
mov dl, 10     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 13      ; color
mov ch, 10    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 11     ;Bottom row of window
mov dl, 6     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 1      ; color
mov ch, 10    ;top row of window
mov cl, 7    ;left most column of window
mov dh, 11    ;Bottom row of window
mov dl, 11     ;Right most column of window
int 10h

;///////////////dots////////
MOV CX, 293    ;(column)    
MOV DX, 120    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 193    ;(column)    
MOV DX, 60    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 85    ;(column)    
MOV DX, 55    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 150    ;(column)    
MOV DX, 45    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 230    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 120    ;(column)    
MOV DX, 80    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 30    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 75    ;(column)    
MOV DX, 110    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 45    ;(column)    
MOV DX, 150    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 105    ;(column)    
MOV DX, 135    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 240    ;(column)    
MOV DX, 140    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 170    ;(column)    
MOV DX, 130    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

;//////////////////////////////////
;/////////////////////////////////
;//////// MENU ENDS  ////////////
;///////////////////////////////
;//////////////////////////////




;//////////////////////////////////
;/////////////////////////////////
;///// MENU OPTIONS  ////////////
;///////////////////////////////
;//////////////////////////////

options:
;setting cursor position
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 4       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h


mov ah,01h
int 16h
jnz nn1
jz options
nn1:

l2:
mov ah,01
int 16h
jnz next11 
jz l2


next11:
mov ah,0h
int 16h

cmp al,13
je Start_Game

mov al, ah
cmp al,48h
je Option_UP
cmp al,50h
je Option_Down

jmp options



Option_UP:
;**************pointer*******
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

;setting cursor position
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 0       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov al,pointer_X
cmp al,7
je Tro
sub pointer_X,3

Tro:
;setting cursor position
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 4       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h

jmp options
Option_Down:
;**************pointer*******
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

;setting cursor position
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 0       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h

mov al,pointer_X
cmp al,19
je Troo
add pointer_X,3

Troo:
;setting cursor position
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 4       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h

jmp options

Start_Game:
.if(pointer_X==7)
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 0       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h
jmp NewGame
.ENDIF
.if(pointer_X==10)
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 0       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h
jmp Instuctions
.ENDIF
.if(pointer_X==13)
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 0       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h
jmp High_Score
.ENDIF
.if(pointer_X==16)
mov ah, 2
mov dh, pointer_X     ;row
mov dl, pointer_Y     ;column
int 10h

mov al,'>'    ;ASCII code of Character 
mov bx,0
mov bl, 0       ;red color
mov cx,1       ;repetition count
mov ah,09h
int 10h
jmp About_us

.ENDIF
.if(pointer_X==19)
jmp Exit5
.ENDIF
jmp options

;//////////////////////////////////
;/////////////////////////////////
;///// MENU OPTIONS ENDS ////////
;///////////////////////////////
;//////////////////////////////


NewGame Proc





mov ah, 6
mov al, 0
mov bh, 11  ;color
mov ch, 0   ;top row of window
mov cl, 0     ;left most column of window
mov dh, 50     ;Bottom row of window
mov dl, 50    ;Right most column of window

int 10h


mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 1    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h



mov cx,0

mov si,@data

mov ah,13h
mov al,0
mov bh,0
mov bl,15

mov cx,17
mov dh,10
mov dl,10
mov es,si
mov bp,offset Enter_Name
int 10h



;setting cursor position
mov ah, 2
mov dh, 12     ;row
mov dl,  12    ;column
int 10h

;/////////////////////////
;////////////////////////
;///// Openn File //////
;//////////////////////
;/////////////////////
mov si,0
mov cx,0
mov ah,3dh
lea dx,file
mov al,2
int 21h
mov Filehandler,ax
Input:
mov ah,01h
int 21h
cmp al,13
je Wrtie
mov buffer[si],al
inc si
inc cx
jmp Input

Wrtie:

mov ah,40h
mov bx,Filehandler
lea dx,buffer
int 21h







;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////;LEVEL 1 STARTS
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
Level_Selection:
.IF(Level_counter==1)
mov score,0
call Display_Score
jmp Continue
.ELSEIF(Level_counter==2)
mov score,12
call Display_Score
jmp Continue2
.ElSEIF(Level_counter==3)
mov score,24
call Display_Score
jmp Continue3

.ENDIF

Continue:

mov remove1_counter, 1
mov remove2_counter ,1
mov remove3_counter,1
mov remove4_counter ,1
mov remove5_counter ,1
mov remove6_counter ,1
mov remove7_counter, 1
mov remove8_counter , 1
mov remove9_counter , 1
mov remove10_counter , 1
mov remove11_counter , 1
mov remove12_counter , 1



mov ax,2
mov bx,0
mov cx,0
mov dx,0
mov Heart_Counter,0
mov digitCount , 0 

mov Start_min, 0
mov min,0
;mover_bar db 1  ;23 left column
;mover2_bar db 6   ;38	right column
 

mov X1,100
mov X2,200
mov Y1,182
mov Y2,192
mov X1_Helper1,130
mov X1_Helper2,169
mov X1_Helper3,200

mov X1_remove,36
mov X2_remove,38
mov Y1_remove,4
mov Y2_Remove,5

mov pointer_X,7
mov pointer_Y,51


mov block1_x1,14
mov block1_x2,55
mov block1_y1,22
mov block1_y2,32

mov block2_x1,64
mov block2_x2,105
mov block2_y1,22
mov block2_y2,32

mov block3_x1,114
mov block3_x2,155
mov block3_y1,22
mov block3_y2,32

mov block4_x1,164
mov block4_x2,205
mov block4_y1,22
mov block4_y2,32

mov block5_x1,214
mov block5_x2,255
mov block5_y1,22
mov block5_y2,32

mov block6_x1,264
mov block6_x2,305
mov block6_y1,22
mov block6_y2,32

mov block7_x1,14
mov block7_x2,55
mov block7_y1,37
mov block7_y2,47

mov block8_x1,64
mov block8_x2,105
mov block8_y1,37
mov block8_y2,47

mov block9_x1,114
mov block9_x2,155
mov block9_y1,37
mov block9_y2,47

mov block10_x1,164
mov block10_x2,205
mov block10_y1,37
mov block10_y2,47

mov block11_x1,214
mov block11_x2,255
mov block11_y1,37
mov block11_y2,47

mov block12_x1,264
mov block12_x2,305
mov block12_y1,37
mov block12_y2,47
.if(Level_counter==1)
mov X1,50
Mov X2,200
mov X1_Helper1 ,110
mov X1_Helper2, 140
mov X1_Helper3 , 200
.ElSEIF(Level_counter==2)
mov X1,80
Mov X2,180
mov X1_Helper1 ,115
mov X1_Helper2, 135
mov X1_Helper3 , 180
.ElSEIF(Level_counter==3)
mov X1,100
Mov X2,150
mov X1_Helper1 , 120
mov X1_Helper2 , 129
mov X1_Helper3 , 150
.ENDIF



mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 1    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h



mov si,@data
mov ah,13h;service to print string in graphic mode
mov al,0;sub-service 0 all the characters will be in the same color(bl) and cursor position is not updated after the string is written
mov bh,0;page number=always zero
mov bl,11;color of the text (white foreground and black background)
;     0000             1111
;|_ Background _| |_ Foreground _|
;

mov cx,8;length of string
;resoultion of the screen is 244x126
mov dh,0;y coordinate
mov dl,13;x coordinate
mov es,si;moves to es the location in memory of the data segment
.if(Level_counter==1)
mov bp,offset Level_display1;mov bp the offset of the string
.ElSEIF(Level_counter==2)
mov bp,offset Level_display2;mov bp the offset of the string
.ElSEIF(Level_counter==3)
mov bp,offset Level_display3;mov bp the offset of the string
.ENDIF

int 10h
;///////////////////////////
;Score kay nechay ki patti/
;/////////////////////////
mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 0    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 8    ;Right most column of window

int 10h

;///////////////////////////
;life kay nechay ki patti//
;/////////////////////////
mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 0    ;top row of window
mov cl, 30     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 1     ;column
int 10h

mov al,'S'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 2     ;column
int 10h

mov al,'C'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 3     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 4     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 5     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl,  6    ;column
int 10h

mov al,':'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl,  8    ;column
int 10h

;call Display_Score
;//////////////////////////////
;/////////////////////////////
;///////Hearts //////////////
;///////////////////////////
;//////////////////////////
call First_Heart
call Second_Heart
call Third_Heart
;//////////////////////////////
;/////////////////////////////
;///////Hearts Ends//////////
;///////////////////////////
;//////////////////////////


;////////////////////////
;Bar code //////////////
;//////////////////////
;
call print
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;/////Bricks Placement /////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////


;//////////////
;Block 1//////
;////////////

MOV CX, block1_x1   ;X1;(column)
MOV DX, block1_y1   ;Y1 ;(row)


Loop1:
l1:
cmp cx, block1_x2;X2
je l3
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l1
l3:
inc dx
mov cx,block1_x1
cmp dx,block1_y2;Y2
je loop11
Loop Loop1

;//////////////
;Block 2//////
;////////////
loop11:
MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


Loop2:
l4:
cmp cx, block2_x2;X2
je l5
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l4
l5:
inc dx
mov cx,block2_x1
cmp dx,block2_y2;Y2
je loop12
Loop Loop2

;//////////////
;Block 3//////
;////////////
loop12:

MOV CX, block3_x1   ;X1;(column)
MOV DX, block3_y1   ;Y1 ;(row)


Loop3:
l6:
cmp cx, block3_x2;X2
je l7
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l6
l7:
inc dx
mov cx,block3_x1
cmp dx,block3_y2;Y2
je loop13
Loop Loop3

;//////////////
;Block 4//////
;////////////

loop13:
MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


Loop4:
l8:
cmp cx, block4_x2;X2
je l9
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l8
l9:
inc dx
mov cx,block4_x1
cmp dx,block4_y2;Y2
je loop14
Loop Loop4


loop14:
;//////////////
;Block 5//////
;////////////

MOV CX, block5_x1   ;X1;(column)
MOV DX, block5_y1   ;Y1 ;(row)


Loop5:
l10:
cmp cx, block5_x2;X2
je l11
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l10
l11:
inc dx
mov cx,block5_x1
cmp dx,block5_y2;Y2
je loop15
Loop Loop5

loop15:
;//////////////
;Block 6//////
;////////////

MOV CX, block6_x1   ;X1;(column)
MOV DX, block6_y1   ;Y1 ;(row)


Loop6:
l12:
cmp cx, block6_x2;X2
je l13
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l12
l13:
inc dx
mov cx,block6_x1
cmp dx,block6_y2;Y2
je loop16
Loop Loop6


loop16:

;//////////////
;Block 7//////
;////////////

MOV CX, block7_x1   ;X1;(column)
MOV DX, block7_y1   ;Y1 ;(row)


Loop7:
l14:
cmp cx, block7_x2;X2
je l15
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l14
l15:
inc dx
mov cx,block7_x1
cmp dx,block7_y2;Y2
je loop17
Loop Loop7


loop17:
;//////////////
;Block 8//////
;////////////

MOV CX, block8_x1   ;X1;(column)
MOV DX, block8_y1   ;Y1 ;(row)


Loop8:
l16:
cmp cx, block8_x2;X2
je l17
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l16
l17:
inc dx
mov cx,block8_x1
cmp dx,block8_y2;Y2
je loop18
Loop Loop8



loop18:
;//////////////
;Block 9//////
;////////////

MOV CX, block9_x1   ;X1;(column)
MOV DX, block9_y1   ;Y1 ;(row)


Loop9:
l18:
cmp cx, block9_x2;X2
je l19
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l18
l19:
inc dx
mov cx,block9_x1
cmp dx,block9_y2;Y2
je loop19
Loop Loop9

loop19:
;//////////////
;Block 10//////
;////////////

MOV CX, block10_x1   ;X1;(column)
MOV DX, block10_y1   ;Y1 ;(row)


Loop10:
l20:
cmp cx, block10_x2;X2
je l21
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l20
l21:
inc dx
mov cx,block10_x1
cmp dx,block10_y2;Y2
je loop20
Loop Loop10

loop20:
;//////////////
;Block 11//////
;////////////

MOV CX, block11_x1   ;X1;(column)
MOV DX, block11_y1   ;Y1 ;(row)


Loop111:
l22:
cmp cx, block11_x2;X2
je l23
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l22
l23:
inc dx
mov cx,block11_x1
cmp dx,block11_y2;Y2
je loop21
Loop Loop111

loop21:
;//////////////
;Block 12//////
;////////////

MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


Loop112:
l24:
cmp cx, block12_x2;X2
je l25
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l24
l25:
inc dx
mov cx,block12_x1
cmp dx,block12_y2;Y2
je M1
Loop Loop112

M1:
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;/////Ball Movement ////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////

;///////////////
;Initial Ball//
;/////////////
Ball1:
call beep2
call beep2
inc Heart_Counter
call Remove_Heart

mov mover,135
mov mover2,180

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h




simple_up:
call board_movement
.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov ax ,X1
mov bx,X2
.IF(falling_Piece_Y1>al&&falling_Piece_Y2<bl)
add mover,10
add mover2,10
sub X1,20
add X2,20
.ENDIF
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif

mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
R1:
cmp bx,block1_x1
jae R2
jmp R3
R2:
cmp bx,block1_x2
jbe remove_1
.ENDIF


R3:
.IF(mover2<=32&&mover2>=22)
R4:
cmp bx,block2_x1
jae R5
jmp R6
R5:
cmp bx,block2_x2
jbe remove_2
.ENDIF


R6:
.IF(mover2<=32&&mover2>=22)
R7:
cmp bx,block3_x1
jae R8
jmp R9
R8:
cmp bx,block3_x2
jbe remove_3
.ENDIF

R9:
.IF(mover2<=32&&mover2>=22)
jmp R12
R10:
cmp bx,block4_x1
jae R11
jmp R12

R11:
cmp bx,block4_x2
jbe remove_4
.ENDIF


R12:
.IF(mover2<=32&&mover2>=22)
R13:
cmp bx,block5_x1
jae R14
jmp R15
R14:
cmp bx,block5_x2
jbe remove_5
.ENDIF

R15:
.IF(mover2<=32&&mover2>=22)
R16:
cmp bx,block6_x1
jae R17
jmp R18
R17:
cmp bx,block6_x2
jbe remove_6
.ENDIF

R18:
.IF(mover2<=47&&mover2>=37)
R19:
cmp bx,block7_x1
jae R20
jmp R21
R20:
cmp bx,block7_x2
jbe remove_7
.ENDIF

R21:
.IF(mover2<=47&&mover2>=37)
R22:
cmp bx,block8_x1
jae R23
jmp R24
R23:
cmp bx,block8_x2
jbe remove_8
.ENDIF

R24:
.IF(mover2<=47&&mover2>=37)
R25:
cmp bx,block9_x1
jae R26
jmp R27
R26:
cmp bx,block9_x2
jbe remove_9
.ENDIF

R27:
.IF(mover2<=47&&mover2>=37)
R28:
cmp bx,block10_x1
jae R29
jmp R30
R29:
cmp bx,block10_x2
jbe remove_10
.ENDIF


R30:
.IF(mover2<=47&&mover2>=37)
R31:
cmp bx,block11_x1
jae R32
jmp R33
R32:
cmp bx,block11_x2
jbe remove_11
.ENDIF


R33:
.IF(mover2<=47&&mover2>=37)
R34:
cmp bx,block12_x1
jae R35
jmp R36
R35:
cmp bx,block12_x2
jbe remove_12
.ENDIF

R36:
cmp mover2,11
jb A21
mov ah,0ch
mov al ,0
mov cx,mover
mov dx,mover2
int 10h


A21:
cmp mover2,10
jbe left

sub mover2,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h


.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp simple_up

left:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF

.IF(falling_Piece_X1>=22)
mov ax ,X1
mov bx,X2
.IF(falling_Piece_Y1>al&&falling_Piece_Y2<bl)
add mover,10
add mover2,10
sub X1,20
add X2,20
.ENDIF
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif


mov bx,mover
mov ax,mover2
.IF(mover2<=32&&mover2>=22)
RL1:
cmp bx,block1_x1
jae RL2
jmp RL3
RL2:
cmp bx,block1_x2
jbe remove_1
.ENDIF


RL3:
.IF(mover2<=32&&mover2>=22)
RL4:
cmp bx,block2_x1
jae RL5
jmp RL6
RL5:
cmp bx,block2_x2
jbe remove_2
.ENDIF

RL6:
.IF(mover2<=32&&mover2>=22)

RL7:
cmp bx,block3_x1
jae RL8
jmp RL9
RL8:
cmp bx,block3_x2
jbe remove_3
.Endif

RL9:
.IF(mover2<=32&&mover2>=22)


RL10:
cmp bx,block4_x1
jae RL11
jmp RL12
RL11:
cmp bx,block4_x2
jbe remove_4
.ENDIF

RL12:
.IF(mover2<=32&&mover2>=22)

RL13:
cmp bx,block5_x1
jae RL14
jmp RL15
RL14:
cmp bx,block5_x2
jbe remove_5
.ENDIF

RL15:
.IF(mover2<=32&&mover2>=22)


RL16:
cmp bx,block6_x1
jae RL17
jmp RL18
RL17:
cmp bx,block6_x2
jbe remove_6
.ENDIF


RL18:
.IF(mover2<=47&&mover2>=37)

RL19:
cmp bx,block7_x1
jae RL20
jmp RL21
RL20:
cmp bx,block7_x2
jbe remove_7
.ENDIF


RL21:

.IF(mover2<=47&&mover2>=37)

RL22:
cmp bx,block8_x1
jae RL23
jmp RL24
RL23:
cmp bx,block8_x2
jbe remove_8
.ENDIF



RL24:
.IF(mover2<=47&&mover2>=37)
RL25:
cmp bx,block9_x1
jae RL26
jmp RL27
RL26:
cmp bx,block9_x2
jbe remove_9
.ENDIF


RL27:
.IF(mover2<=47&&mover2>=37)
RL28:
cmp bx,block10_x1
jae RL29
jmp RL30
RL29:
cmp bx,block10_x2
jbe remove_10
.ENDIF


RL30:
.IF(mover2<=47&&mover2>=37)
RL31:
cmp bx,block11_x1
jae RL32
jmp RL33
RL32:
cmp bx,block11_x2
jbe remove_11
.ENDIF


RL33:
.IF(mover2<=47&&mover2>=37)
RL34:
cmp bx,block12_x1
jae RL35
jmp RL36
RL35:
cmp bx,block12_x2
jbe remove_12
.ENDIF


RL36:

cmp mover,16
jb A1
cmp mover2,11
jb A1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h


A1:

cmp mover2,10
jbe down
cmp mover,15
jbe up



sub mover,1
sub mover2,2

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h

.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp Left

up:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov ax ,X1
mov bx,X2
.IF(falling_Piece_Y1>al&&falling_Piece_Y2<bl)
add mover,10
add mover2,10
sub X1,20
add X2,20
.ENDIF
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif

mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
RU1:
cmp bx,block1_x1
jae RU2
jmp RU3
RU2:
cmp bx,block1_x2
jbe remove_1
.ENDIF

RU3:
.IF(mover2<=32&&mover2>=22)
RU4:
cmp bx,block2_x1
jae RU5
jmp RU6
RU5:
cmp bx,block2_x2
jbe remove_2
.ENDIF

RU6:

.IF(mover2<=32&&mover2>=22)
RU7:
cmp bx,block3_x1
jae RU8
jmp RU9
RU8:
cmp bx,block3_x2
jbe remove_3
.ENDIF

RU9:

.IF(mover2<=32&&mover2>=22)
RU10:
cmp bx,block4_x1
jae RU11
jmp RU12
RU11:
cmp bx,block4_x2
jbe remove_4
.ENDIF

RU12:

.IF(mover2<=32&&mover2>=22)
RU13:
cmp bx,block5_x1
jae RU14
jmp RU15
RU14:
cmp bx,block5_x2
jbe remove_5
.ENDIF

RU15:

.IF(mover2<=32&&mover2>=22)
RU16:
cmp bx,block6_x1
jae RU17
jmp RU18
RU17:
cmp bx,block6_x2
jbe remove_6
.ENDIF
RU18:
.IF(mover2<=47&&mover2>=37)
RU19:
cmp bx,block7_x1
jae RU20
jmp RU21
RU20:
cmp bx,block7_x2
jbe remove_7
.ENDIF

RU21:
.IF(mover2<=47&&mover2>=37)
RU22:
cmp bx,block8_x1
jae RU23
jmp RU24
RU23:
cmp bx,block8_x2
jbe remove_8
.ENDIF

RU24:
.IF(mover2<=47&&mover2>=37)
RU25:
cmp bx,block9_x1
jae RU26
jmp RU27
RU26:
cmp bx,block9_x2
jbe remove_9
.ENDIF

RU27:

.IF(mover2<=47&&mover2>=37)
RU28:
cmp bx,block10_x1
jae RU29
jmp RU30
RU29:
cmp bx,block10_x2
jbe remove_10
.ENDIF

RU30:

.IF(mover2<=47&&mover2>=37)
RU31:
cmp bx,block11_x1
jae RU32
jmp RU33
RU32:
cmp bx,block11_x2
jbe remove_11
.ENDIF

RU33:

.IF(mover2<=47&&mover2>=37)
RU34:
cmp bx,block12_x1
jae RU35
jmp RU36
RU35:
cmp bx,block12_x2
jbe remove_12
.ENDIF

RU36:

cmp mover,304
ja A2
cmp mover2,11
jb A2
mov ah,0ch
mov al ,0
mov cx,mover
mov dx,mover2
int 10h

A2:
cmp mover2,10
jbe right
cmp mover,305
jae left

sub mover2,1
add mover,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h

.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp up


right:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov ax ,X1
mov bx,X2
.IF(falling_Piece_Y1>al&&falling_Piece_Y2<bl)
add mover,10
add mover2,10
sub X1,20
add X2,20
.ENDIF
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif




mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)

RR1:
cmp bx,block1_x1
jae RR2
jmp RR3
RR2:
cmp bx,block1_x2
jbe remove_1
.ENDIF

RR3:
.IF(mover2<=32&&mover2>=22)

RR4:
cmp bx,block2_x1
jae RR5
jmp RR6
RR5:
cmp bx,block2_x2
jbe remove_2
.ENDIF

RR6:

.IF(mover2<=32&&mover2>=22)

RR7:
cmp bx,block3_x1
jae RR8
jmp RR9
RR8:
cmp bx,block3_x2
jbe remove_3
.ENDIF

RR9:

.IF(mover2<=32&&mover2>=22)

RR10:
cmp bx,block4_x1
jae RR11
jmp RR12
RR11:
cmp bx,block4_x2
jbe remove_4
.ENDIF

RR12:

.IF(mover2<=32&&mover2>=22)

RR13:
cmp bx,block5_x1
jae RR14
jmp RR15
RR14:
cmp bx,block5_x2
jbe remove_5
.ENDIF

RR15:

.IF(mover2<=32&&mover2>=22)

RR16:
cmp bx,block6_x1
jae RR17
jmp RR18
RR17:
cmp bx,block6_x2
jbe remove_6
.ENDIF

RR18:

.IF(mover2<=47&&mover2>=37)
RR19:
cmp bx,block7_x1
jae RR20
jmp RR21
RR20:
cmp bx,block7_x2
jbe remove_7
.ENDIF
RR21:

.IF(mover2<=47&&mover2>=37)
RR22:
cmp bx,block8_x1
jae RR23
jmp RR24
RR23:
cmp bx,block8_x2
jbe remove_8
.ENDIF

RR24:

.IF(mover2<=47&&mover2>=37)
RR25:
cmp bx,block9_x1
jae RR26
jmp RR27
RR26:
cmp bx,block9_x2
jbe remove_9
.ENDIF

RR27:

.IF(mover2<=47&&mover2>=37)
RR28:
cmp bx,block10_x1
jae RR29
jmp RR30
RR29:
cmp bx,block10_x2
jbe remove_10
.ENDIF

RR30:

.IF(mover2<=47&&mover2>=37)
RR31:
cmp bx,block11_x1
jae RR32
jmp RR33
RR32:
cmp bx,block11_x2
jbe remove_11
.ENDIF

RR33:

.IF(mover2<=47&&mover2>=37)
RR34:
cmp bx,block12_x1
jae RR35
jmp RR36
RR35:
cmp bx,block12_x2
jbe remove_12
.ENDIF

RR36:
cmp mover,304
ja A4
cmp mover2,184
ja A4

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h

A4:
cmp mover2,180
je J10
cmp mover2,185
jae J1
jmp J2
 
 
J10:
mov ax,mover
cmp ax,X1
jae J11
jmp J1
 
 
J11:
cmp ax,X2
jae J1
cmp ax,X1_Helper1
jbe left
cmp ax,X1_Helper2
jbe simple_up
cmp ax,X2
jmp up

J1:

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
jae Ball1

J2:
cmp mover,305
jae down

add mover,1
add mover2,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h
.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF

jmp right


down:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov ax ,X1
mov bx,X2
.IF(falling_Piece_Y1>al&&falling_Piece_Y2<bl)
add mover,10
add mover2,10
sub X1,20
add X2,20
.ENDIF
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif
mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
RD1:
cmp bx,block1_x1
jae RD2
jmp RD3
RD2:
cmp bx,block1_x2
jbe remove_1
.ENDIF
RD3:
.IF(mover2<=32&&mover2>=22)
RD4:
cmp bx,block2_x1
jae RD5
jmp RD6
RD5:
cmp bx,block2_x2
jbe remove_2
.ENDIF
RD6:
.IF(mover2<=32&&mover2>=22)
RD7:
cmp bx,block3_x2
jbe RD8
jmp Rd9
RD8:
cmp bx,block3_x1
jae remove_3
.ENDIF
RD9:

.IF(mover2<=32&&mover2>=22)
RD10:
cmp bx,block4_x1
jae RD11
jmp RD12
RD11:
cmp bx,block4_x2
jbe remove_4
.ENDIF
RD12:

.IF(mover2<=32&&mover2>=22)
RD13:
cmp bx,block5_x1
jae RD14
jmp RD15
RD14:
cmp bx,block5_x2
jbe remove_5
.ENDIF
RD15:

.IF(mover2<=32&&mover2>=22)
RD16:
cmp bx,block6_x1
jae RD17
jmp RD18
RD17:
cmp bx,block6_x2
jbe remove_6
.ENDIF
RD18:

.IF(mover2<=47&&mover2>=37)
RD19:
cmp bx,block7_x1
jae RD20
jmp RD21
RD20:
cmp bx,block7_x2
jbe remove_7
.ENDIF
RD21:
.IF(mover2<=47&&mover2>=37)
RD22:
cmp bx,block8_x1
jae RD23
jmp RD24
RD23:
cmp bx,block8_x2
jbe remove_8
.ENDIF
RD24:

.IF(mover2<=47&&mover2>=37)
RD25:
cmp bx,block9_x1
jae RD26
jmp RD27
RD26:
cmp bx,block9_x2
jbe remove_9
.ENDIF
RD27:

.IF(mover2<=47&&mover2>=37)
RD28:
cmp bx,block10_x1
jae RD29
jmp RD30
RD29:
cmp bx,block10_x2
jbe remove_10
.ENDIF
RD30:

.IF(mover2<=47&&mover2>=37)
RD31:
cmp bx,block11_x1
jae RD32
jmp RD33
RD32:
cmp bx,block11_x2
jbe remove_11
.ENDIF
RD33:

.IF(mover2<=47&&mover2>=37)
RD34:
cmp bx,block12_x1
jae RD35
jmp RD36
RD35:
cmp bx,block12_x2
jbe remove_12
.ENDIF
RD36:

cmp mover,16
jb A3
cmp mover2,184
ja A3 


mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h

A3:
cmp mover2,180
Ja J15
cmp mover2,185
jae J3
jmp J4


J15:
mov ax,mover
cmp ax,X1
jbe J3
jmp J16
 

J16:
cmp ax,X2
jae J3 
cmp ax,X1_Helper1
jbe left
cmp ax,X1_Helper2
jbe simple_up
jmp up 

J3:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
jmp Ball1

J4:
cmp mover,15
jbe right

sub mover,1
add mover2,1


mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h
.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF

jmp down


remove_1:
call beep


add score,1
call Display_Score


.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block1_x1,ax
mov block1_x2,ax
mov block1_y1,ax
mov block1_y2,ax


mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 1     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 6    ;Right most column of window
int 10h

mov falling_Piece_X1,3
mov falling_Piece_X2,3
mov falling_Piece_Y1,3
mov falling_Piece_Y2,3
mov falling_Piece_Counter,1
jmp right

remove_2:
call beep
add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block2_x1,ax
mov block2_x2,ax
mov block2_y1,ax
mov block2_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 7     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 13    ;Right most column of window

int 10h
jmp down

remove_3:
call beep

add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block3_x1,ax
mov block3_x2,ax
mov block3_y1,ax
mov block3_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 14     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 19    ;Right most column of window

int 10h
jmp right

remove_4:
call beep

add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block4_x1,ax
mov block4_x2,ax
mov block4_y1,ax
mov block4_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 20     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 25    ;Right most column of window

int 10h
jmp down

remove_5:
call beep

add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF

mov ax,0
mov block5_x1,ax
mov block5_x2,ax
mov block5_y1,ax
mov block5_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 26     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 31    ;Right most column of window

int 10h
jmp right


remove_6:
call beep
add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block6_x1,ax
mov block6_x2,ax
mov block6_y1,ax
mov block6_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 32     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h
jmp down

remove_7:
call beep

add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block7_x1,ax
mov block7_x2,ax
mov block7_y1,ax
mov block7_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 1     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 6    ;Right most column of window

int 10h
jmp right


remove_8:
call beep


add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block8_x1,ax
mov block8_x2,ax
mov block8_y1,ax
mov block8_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 7     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 13    ;Right most column of window

int 10h
jmp down


remove_9:
call beep
add score,1

call Display_Score

.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block9_x1,ax
mov block9_x2,ax
mov block9_y1,ax
mov block9_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 14     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 19    ;Right most column of window



mov falling_Piece_X1,5
mov falling_Piece_X2,5
mov falling_Piece_Y1,16
mov falling_Piece_Y2,16
mov falling_Piece_Counter,1
int 10h

jmp right

remove_10:
call beep
add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block10_x1,ax
mov block10_x2,ax
mov block10_y1,ax
mov block10_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 20     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 25    ;Right most column of window

int 10h
jmp down

remove_11:
call beep


add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block11_x1,ax
mov block11_x2,ax
mov block11_y1,ax
mov block11_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 26     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 31    ;Right most column of window

int 10h
jmp right

remove_12:
call beep


add score,1
call Display_Score
.if(score==12)
add Level_counter,1
jmp Continue2
.ENDIF
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block12_x1,ax
mov block12_x2,ax
mov block12_y1,ax
mov block12_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 32     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h
jmp down


;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;////Ball Movement Ends ////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
NewGame endp

;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////;LEVEL 1 ENDS
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////


Continue2:
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////;LEVEL 2 STARTS
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov Heart_Counter,0
mov digitCount , 0 

mov Start_min, 0
mov min,0
;mover_bar db 1  ;23 left column
;mover2_bar db 6   ;38	right column
 

mov X1,100
mov X2,200
mov Y1,182
mov Y2,192
mov X1_Helper1,130
mov X1_Helper2,169
mov X1_Helper3,200

mov X1_remove,36
mov X2_remove,38
mov Y1_remove,4
mov Y2_Remove,5

mov pointer_X,7
mov pointer_Y,51

mov block1_x1,14
mov block1_x2,55
mov block1_y1,22
mov block1_y2,32

mov block2_x1,64
mov block2_x2,105
mov block2_y1,22
mov block2_y2,32

mov block3_x1,114
mov block3_x2,155
mov block3_y1,22
mov block3_y2,32

mov block4_x1,164
mov block4_x2,205
mov block4_y1,22
mov block4_y2,32

mov block5_x1,214
mov block5_x2,255
mov block5_y1,22
mov block5_y2,32

mov block6_x1,264
mov block6_x2,305
mov block6_y1,22
mov block6_y2,32

mov block7_x1,14
mov block7_x2,55
mov block7_y1,37
mov block7_y2,47

mov block8_x1,64
mov block8_x2,105
mov block8_y1,37
mov block8_y2,47

mov block9_x1,114
mov block9_x2,155
mov block9_y1,37
mov block9_y2,47

mov block10_x1,164
mov block10_x2,205
mov block10_y1,37
mov block10_y2,47

mov block11_x1,214
mov block11_x2,255
mov block11_y1,37
mov block11_y2,47

mov block12_x1,264
mov block12_x2,305
mov block12_y1,37
mov block12_y2,47


mov remove1_counter, 1
mov remove2_counter ,1
mov remove3_counter,1
mov remove4_counter ,1
mov remove5_counter ,1
mov remove6_counter ,1
mov remove7_counter, 1
mov remove8_counter , 1
mov remove9_counter , 1
mov remove10_counter , 1
mov remove11_counter , 1
mov remove12_counter , 1


.if(Level_counter==1)
mov X1,50
Mov X2,200
mov X1_Helper1 ,110
mov X1_Helper2, 140
mov X1_Helper3 , 200
.ElSEIF(Level_counter==2)
mov X1,80
Mov X2,180
mov X1_Helper1 ,115
mov X1_Helper2, 135
mov X1_Helper3 , 180
.ElSEIF(Level_counter==3)
mov X1,100
Mov X2,150
mov X1_Helper1 , 120
mov X1_Helper2 , 129
mov X1_Helper3 , 150
.ENDIF



mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 1    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h



mov si,@data
mov ah,13h;service to print string in graphic mode
mov al,0;sub-service 0 all the characters will be in the same color(bl) and cursor position is not updated after the string is written
mov bh,0;page number=always zero
mov bl,11;color of the text (white foreground and black background)
;     0000             1111
;|_ Background _| |_ Foreground _|
;

mov cx,8;length of string
;resoultion of the screen is 244x126
mov dh,0;y coordinate
mov dl,13;x coordinate
mov es,si;moves to es the location in memory of the data segment
.if(Level_counter==1)
mov bp,offset Level_display1;mov bp the offset of the string
.ElSEIF(Level_counter==2)
mov bp,offset Level_display2;mov bp the offset of the string
.ElSEIF(Level_counter==3)
mov bp,offset Level_display3;mov bp the offset of the string
.ENDIF

int 10h
;///////////////////////////
;Score kay nechay ki patti/
;/////////////////////////
mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 0    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 8    ;Right most column of window

int 10h

;///////////////////////////
;life kay nechay ki patti//
;/////////////////////////
mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 0    ;top row of window
mov cl, 30     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 1     ;column
int 10h

mov al,'S'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 2     ;column
int 10h

mov al,'C'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 3     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 4     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 5     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl,  6    ;column
int 10h

mov al,':'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl,  8    ;column
int 10h

call Display_Score

;//////////////////////////////
;/////////////////////////////
;///////Hearts //////////////
;///////////////////////////
;//////////////////////////
call First_Heart
call Second_Heart
call Third_Heart
;//////////////////////////////
;/////////////////////////////
;///////Hearts Ends//////////
;///////////////////////////
;//////////////////////////


;////////////////////////
;Bar code //////////////
;//////////////////////
;
call print
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;/////Bricks Placement /////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////


;//////////////
;Block 1//////
;////////////

MOV CX, block1_x1   ;X1;(column)
MOV DX, block1_y1   ;Y1 ;(row)


C2Loop1:
C2l1:
cmp cx, block1_x2;X2
je C2l3
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l1
C2l3:
inc dx
mov cx,block1_x1
cmp dx,block1_y2;Y2
je C2loop11
Loop C2Loop1

;//////////////
;Block 2//////
;////////////
C2loop11:
MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C2Loop2:
C2l4:
cmp cx, block2_x2;X2
je C2l5
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l4
C2l5:
inc dx
mov cx,block2_x1
cmp dx,block2_y2;Y2
je C2loop12
Loop C2Loop2

;//////////////
;Block 3//////
;////////////
C2loop12:

MOV CX, block3_x1   ;X1;(column)
MOV DX, block3_y1   ;Y1 ;(row)


C2Loop3:
C2l6:
cmp cx, block3_x2;X2
je C2l7
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l6
C2l7:
inc dx
mov cx,block3_x1
cmp dx,block3_y2;Y2
je C2loop13
Loop C2Loop3

;//////////////
;Block 4//////
;////////////

C2loop13:
MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C2Loop4:
C2l8:
cmp cx, block4_x2;X2
je C2l9
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l8
C2l9:
inc dx
mov cx,block4_x1
cmp dx,block4_y2;Y2
je C2loop14
Loop C2Loop4


C2loop14:
;//////////////
;Block 5//////
;////////////

MOV CX, block5_x1   ;X1;(column)
MOV DX, block5_y1   ;Y1 ;(row)


C2Loop5:
C2l10:
cmp cx, block5_x2;X2
je C2l11
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l10
C2l11:
inc dx
mov cx,block5_x1
cmp dx,block5_y2;Y2
je C2loop15
Loop C2Loop5

C2loop15:
;//////////////
;Block 6//////
;////////////

MOV CX, block6_x1   ;X1;(column)
MOV DX, block6_y1   ;Y1 ;(row)


C2Loop6:
C2l12:
cmp cx, block6_x2;X2
je C2l13
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l12
C2l13:
inc dx
mov cx,block6_x1
cmp dx,block6_y2;Y2
je C2loop16
Loop C2Loop6


C2loop16:

;//////////////
;Block 7//////
;////////////

MOV CX, block7_x1   ;X1;(column)
MOV DX, block7_y1   ;Y1 ;(row)


C2Loop7:
C2l14:
cmp cx, block7_x2;X2
je C2l15
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l14
C2l15:
inc dx
mov cx,block7_x1
cmp dx,block7_y2;Y2
je C2loop17
Loop C2Loop7


C2loop17:
;//////////////
;Block 8//////
;////////////

MOV CX, block8_x1   ;X1;(column)
MOV DX, block8_y1   ;Y1 ;(row)


C2Loop8:
C2l16:
cmp cx, block8_x2;X2
je C2l17
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l16
C2l17:
inc dx
mov cx,block8_x1
cmp dx,block8_y2;Y2
je C2loop18
Loop C2Loop8



C2loop18:
;//////////////
;Block 9//////
;////////////

MOV CX, block9_x1   ;X1;(column)
MOV DX, block9_y1   ;Y1 ;(row)


C2Loop9:
C2l18:
cmp cx, block9_x2;X2
je C2l19
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l18
C2l19:
inc dx
mov cx,block9_x1
cmp dx,block9_y2;Y2
je C2loop19
Loop C2Loop9

C2loop19:
;//////////////
;Block 10//////
;////////////

MOV CX, block10_x1   ;X1;(column)
MOV DX, block10_y1   ;Y1 ;(row)


C2Loop10:
C2l20:
cmp cx, block10_x2;X2
je C2l21
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l20
C2l21:
inc dx
mov cx,block10_x1
cmp dx,block10_y2;Y2
je C2loop20
Loop C2Loop10

C2loop20:
;//////////////
;Block 11//////
;////////////

MOV CX, block11_x1   ;X1;(column)
MOV DX, block11_y1   ;Y1 ;(row)


C2Loop111:
C2l22:
cmp cx, block11_x2;X2
je C2l23
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l22
C2l23:
inc dx
mov cx,block11_x1
cmp dx,block11_y2;Y2
je C2loop21
Loop C2Loop111

C2loop21:
;//////////////
;Block 12//////
;////////////

MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


C2Loop112:
C2l24:
cmp cx, block12_x2;X2
je C2l25
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l24
C2l25:
inc dx
mov cx,block12_x1
cmp dx,block12_y2;Y2
je C2M1
Loop C2Loop112

C2M1:
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;/////Ball Movement ////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////

;///////////////
;Initial Ball//
;/////////////
C2Ball1:
call beep2
call beep2
inc Heart_Counter
call Remove_Heart

mov mover,135
mov mover2,180

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h




C2simple_up:
simple_up:
call board_movement
.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif

mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C2R1:
cmp bx,block1_x1
jae C2R2
jmp C2R3
C2R2:
cmp bx,block1_x2
jbe C2remove_1
.ENDIF


C2R3:
.IF(mover2<=32&&mover2>=22)
C2R4:
cmp bx,block2_x1
jae C2R5
jmp C2R6
C2R5:
cmp bx,block2_x2
jbe C2remove_2
.ENDIF


C2R6:
.IF(mover2<=32&&mover2>=22)
C2R7:
cmp bx,block3_x1
jae C2R8
jmp C2R9
C2R8:
cmp bx,block3_x2
jbe C2remove_3
.ENDIF

C2R9:
.IF(mover2<=32&&mover2>=22)
jmp C2R12
C2R10:
cmp bx,block4_x1
jae C2R11
jmp C2R12

C2R11:
cmp bx,block4_x2
jbe C2remove_4
.ENDIF


C2R12:
.IF(mover2<=32&&mover2>=22)
C2R13:
cmp bx,block5_x1
jae C2R14
jmp C2R15
C2R14:
cmp bx,block5_x2
jbe C2remove_5
.ENDIF

C2R15:
.IF(mover2<=32&&mover2>=22)
C2R16:
cmp bx,block6_x1
jae C2R17
jmp C2R18
C2R17:
cmp bx,block6_x2
jbe C2remove_6
.ENDIF

C2R18:
.IF(mover2<=47&&mover2>=37)
C2R19:
cmp bx,block7_x1
jae C2R20
jmp C2R21
C2R20:
cmp bx,block7_x2
jbe C2remove_7
.ENDIF

C2R21:
.IF(mover2<=47&&mover2>=37)
C2R22:
cmp bx,block8_x1
jae C2R23
jmp C2R24
C2R23:
cmp bx,block8_x2
jbe C2remove_8
.ENDIF

C2R24:
.IF(mover2<=47&&mover2>=37)
C2R25:
cmp bx,block9_x1
jae C2R26
jmp C2R27
C2R26:
cmp bx,block9_x2
jbe C2remove_9
.ENDIF

C2R27:
.IF(mover2<=47&&mover2>=37)
C2R28:
cmp bx,block10_x1
jae C2R29
jmp C2R30
C2R29:
cmp bx,block10_x2
jbe C2remove_10
.ENDIF


C2R30:
.IF(mover2<=47&&mover2>=37)
C2R31:
cmp bx,block11_x1
jae C2R32
jmp C2R33
C2R32:
cmp bx,block11_x2
jbe C2remove_11
.ENDIF


C2R33:
.IF(mover2<=47&&mover2>=37)
C2R34:
cmp bx,block12_x1
jae C2R35
jmp C2R36
C2R35:
cmp bx,block12_x2
jbe C2remove_12
.ENDIF

C2R36:
cmp mover2,11
jb C2A21
mov ah,0ch
mov al ,0
mov cx,mover
mov dx,mover2
int 10h


C2A21:
cmp mover2,10
jbe C2left

sub mover2,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h


.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp C2simple_up

C2left:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF

.IF(falling_Piece_X1>=22)
mov ax ,X1
mov bx,X2
.IF(falling_Piece_Y1>al&&falling_Piece_Y2<bl)
add mover,10
add mover2,10
sub X1,20
add X2,20
.ENDIF
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif


mov bx,mover
mov ax,mover2
.IF(mover2<=32&&mover2>=22)
C2RL1:
cmp bx,block1_x1
jae C2RL2
jmp C2RL3
C2RL2:
cmp bx,block1_x2
jbe C2remove_1
.ENDIF


C2RL3:
.IF(mover2<=32&&mover2>=22)
C2RL4:
cmp bx,block2_x1
jae C2RL5
jmp C2RL6
C2RL5:
cmp bx,block2_x2
jbe C2remove_2
.ENDIF

C2RL6:
.IF(mover2<=32&&mover2>=22)

C2RL7:
cmp bx,block3_x1
jae C2RL8
jmp C2RL9
C2RL8:
cmp bx,block3_x2
jbe C2remove_3
.Endif

C2RL9:
.IF(mover2<=32&&mover2>=22)


C2RL10:
cmp bx,block4_x1
jae C2RL11
jmp C2RL12
C2RL11:
cmp bx,block4_x2
jbe C2remove_4
.ENDIF

C2RL12:
.IF(mover2<=32&&mover2>=22)

C2RL13:
cmp bx,block5_x1
jae C2RL14
jmp C2RL15
C2RL14:
cmp bx,block5_x2
jbe C2remove_5
.ENDIF

C2RL15:
.IF(mover2<=32&&mover2>=22)


C2RL16:
cmp bx,block6_x1
jae C2RL17
jmp C2RL18
C2RL17:
cmp bx,block6_x2
jbe C2remove_6
.ENDIF


C2RL18:
.IF(mover2<=47&&mover2>=37)

C2RL19:
cmp bx,block7_x1
jae C2RL20
jmp C2RL21
C2RL20:
cmp bx,block7_x2
jbe C2remove_7
.ENDIF


C2RL21:

.IF(mover2<=47&&mover2>=37)

C2RL22:
cmp bx,block8_x1
jae C2RL23
jmp C2RL24
C2RL23:
cmp bx,block8_x2
jbe C2remove_8
.ENDIF



C2RL24:
.IF(mover2<=47&&mover2>=37)
C2RL25:
cmp bx,block9_x1
jae C2RL26
jmp C2RL27
C2RL26:
cmp bx,block9_x2
jbe C2remove_9
.ENDIF


C2RL27:
.IF(mover2<=47&&mover2>=37)
C2RL28:
cmp bx,block10_x1
jae C2RL29
jmp C2RL30
C2RL29:
cmp bx,block10_x2
jbe C2remove_10
.ENDIF


C2RL30:
.IF(mover2<=47&&mover2>=37)
C2RL31:
cmp bx,block11_x1
jae C2RL32
jmp C2RL33
C2RL32:
cmp bx,block11_x2
jbe C2remove_11
.ENDIF


C2RL33:
.IF(mover2<=47&&mover2>=37)
C2RL34:
cmp bx,block12_x1
jae C2RL35
jmp C2RL36
C2RL35:
cmp bx,block12_x2
jbe C2remove_12
.ENDIF

C2RL36:

cmp mover,16
jb C2A1
cmp mover2,11
jb C2A1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h


C2A1:

cmp mover2,10
jbe C2down
cmp mover,15
jbe C2up



sub mover,1
sub mover2,2

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h

.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp C2Left

C2up:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov ax ,X1
mov bx,X2
.IF(falling_Piece_Y1>al&&falling_Piece_Y2<bl)
add mover,10
add mover2,10
sub X1,20
add X2,20
.ENDIF
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif

mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C2RU1:
cmp bx,block1_x1
jae C2RU2
jmp C2RU3
C2RU2:
cmp bx,block1_x2
jbe C2remove_1
.ENDIF

C2RU3:
.IF(mover2<=32&&mover2>=22)
C2RU4:
cmp bx,block2_x1
jae C2RU5
jmp C2RU6
C2RU5:
cmp bx,block2_x2
jbe C2remove_2
.ENDIF

C2RU6:

.IF(mover2<=32&&mover2>=22)
C2RU7:
cmp bx,block3_x1
jae C2RU8
jmp C2RU9
C2RU8:
cmp bx,block3_x2
jbe C2remove_3
.ENDIF

C2RU9:

.IF(mover2<=32&&mover2>=22)
C2RU10:
cmp bx,block4_x1
jae C2RU11
jmp C2RU12
C2RU11:
cmp bx,block4_x2
jbe C2remove_4
.ENDIF

C2RU12:

.IF(mover2<=32&&mover2>=22)
C2RU13:
cmp bx,block5_x1
jae C2RU14
jmp C2RU15
C2RU14:
cmp bx,block5_x2
jbe C2remove_5
.ENDIF

C2RU15:

.IF(mover2<=32&&mover2>=22)
C2RU16:
cmp bx,block6_x1
jae C2RU17
jmp C2RU18
C2RU17:
cmp bx,block6_x2
jbe C2remove_6
.ENDIF
C2RU18:
.IF(mover2<=47&&mover2>=37)
C2RU19:
cmp bx,block7_x1
jae C2RU20
jmp C2RU21
C2RU20:
cmp bx,block7_x2
jbe C2remove_7
.ENDIF

C2RU21:
.IF(mover2<=47&&mover2>=37)
C2RU22:
cmp bx,block8_x1
jae C2RU23
jmp C2RU24
C2RU23:
cmp bx,block8_x2
jbe C2remove_8
.ENDIF

C2RU24:
.IF(mover2<=47&&mover2>=37)
C2RU25:
cmp bx,block9_x1
jae C2RU26
jmp C2RU27
C2RU26:
cmp bx,block9_x2
jbe C2remove_9
.ENDIF

C2RU27:

.IF(mover2<=47&&mover2>=37)
C2RU28:
cmp bx,block10_x1
jae C2RU29
jmp C2RU30
C2RU29:
cmp bx,block10_x2
jbe C2remove_10
.ENDIF

C2RU30:

.IF(mover2<=47&&mover2>=37)
C2RU31:
cmp bx,block11_x1
jae C2RU32
jmp C2RU33
C2RU32:
cmp bx,block11_x2
jbe C2remove_11
.ENDIF

C2RU33:

.IF(mover2<=47&&mover2>=37)
C2RU34:
cmp bx,block12_x1
jae C2RU35
jmp C2RU36
C2RU35:
cmp bx,block12_x2
jbe C2remove_12
.ENDIF

C2RU36:

cmp mover,304
ja C2A2
cmp mover2,11
jb C2A2
mov ah,0ch
mov al ,0
mov cx,mover
mov dx,mover2
int 10h

C2A2:
cmp mover2,10
jbe C2right
cmp mover,305
jae C2left

sub mover2,1
add mover,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h

.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp C2up


C2right:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif




mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C2RR1:
cmp bx,block1_x1
jae C2RR2
jmp C2RR3
C2RR2:
cmp bx,block1_x2
jbe C2remove_1
.ENDIF
C2RR3:
.IF(mover2<=32&&mover2>=22)
C2RR4:
cmp bx,block2_x1
jae C2RR5
jmp C2RR6
C2RR5:
cmp bx,block2_x2
jbe C2remove_2
.ENDIF
C2RR6:

.IF(mover2<=32&&mover2>=22)
C2RR7:
cmp bx,block3_x1
jae C2RR8
jmp C2RR9
C2RR8:
cmp bx,block3_x2
jbe C2remove_3
.ENDIF
C2RR9:

.IF(mover2<=32&&mover2>=22)
C2RR10:
cmp bx,block4_x1
jae C2RR11
jmp C2RR12
C2RR11:
cmp bx,block4_x2
jbe C2remove_4
.ENDIF
C2RR12:

.IF(mover2<=32&&mover2>=22)
C2RR13:
cmp bx,block5_x1
jae C2RR14
jmp C2RR15
C2RR14:
cmp bx,block5_x2
jbe C2remove_5
.ENDIF
C2RR15:

.IF(mover2<=32&&mover2>=22)
C2RR16:
cmp bx,block6_x1
jae C2RR17
jmp C2RR18
C2RR17:
cmp bx,block6_x2
jbe C2remove_6
.ENDIF
C2RR18:

.IF(mover2<=47&&mover2>=37)
C2RR19:
cmp bx,block7_x1
jae C2RR20
jmp C2RR21
C2RR20:
cmp bx,block7_x2
jbe C2remove_7
.ENDIF
C2RR21:

.IF(mover2<=47&&mover2>=37)
C2RR22:
cmp bx,block8_x1
jae C2RR23
jmp C2RR24
C2RR23:
cmp bx,block8_x2
jbe C2remove_8
.ENDIF
C2RR24:

.IF(mover2<=47&&mover2>=37)
C2RR25:
cmp bx,block9_x1
jae C2RR26
jmp C2RR27
C2RR26:
cmp bx,block9_x2
jbe C2remove_9
.ENDIF
C2RR27:

.IF(mover2<=47&&mover2>=37)
C2RR28:
cmp bx,block10_x1
jae C2RR29
jmp C2RR30
C2RR29:
cmp bx,block10_x2
jbe C2remove_10
.ENDIF
C2RR30:

.IF(mover2<=47&&mover2>=37)
C2RR31:
cmp bx,block11_x1
jae C2RR32
jmp C2RR33
C2RR32:
cmp bx,block11_x2
jbe C2remove_11
.ENDIF
C2RR33:

.IF(mover2<=47&&mover2>=37)
C2RR34:
cmp bx,block12_x1
jae C2RR35
jmp C2RR36
C2RR35:
cmp bx,block12_x2
jbe C2remove_12
.ENDIF


C2RR36:
cmp mover,304
ja C2A4
cmp mover2,184
ja C2A4

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h

C2A4:
cmp mover2,180
je C2J10
cmp mover2,185
jae C2J1
jmp C2J2
 
 
C2J10:
mov ax,mover
cmp ax,X1
jae C2J11
jmp C2J1
 
 
C2J11:
cmp ax,X2
jae C2J1
cmp ax,X1_Helper1
jbe C2left
cmp ax,X1_Helper2
jbe C2simple_up
cmp ax,X2
jmp C2up

C2J1:

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
jae C2Ball1

C2J2:
cmp mover,305
jae C2down

add mover,1
add mover2,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h
.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF

jmp C2right


C2down:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif
mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C2RD1:
cmp bx,block1_x1
jae C2RD2
jmp C2RD3
C2RD2:
cmp bx,block1_x2
jbe C2remove_1
.ENDIF
C2RD3:
.IF(mover2<=32&&mover2>=22)
C2RD4:
cmp bx,block2_x1
jae C2RD5
jmp C2RD6
C2RD5:
cmp bx,block2_x2
jbe C2remove_2
.ENDIF
C2RD6:
.IF(mover2<=32&&mover2>=22)
C2RD7:
cmp bx,block3_x2
jbe C2RD8
jmp C2RD9
C2RD8:
cmp bx,block3_x1
jae C2remove_3
.ENDIF
C2RD9:

.IF(mover2<=32&&mover2>=22)
C2RD10:
cmp bx,block4_x1
jae C2RD11
jmp C2RD12
C2RD11:
cmp bx,block4_x2
jbe C2remove_4
.ENDIF
C2RD12:

.IF(mover2<=32&&mover2>=22)
C2RD13:
cmp bx,block5_x1
jae C2RD14
jmp C2RD15
C2RD14:
cmp bx,block5_x2
jbe C2remove_5
.ENDIF
C2RD15:

.IF(mover2<=32&&mover2>=22)
C2RD16:
cmp bx,block6_x1
jae C2RD17
jmp C2RD18
C2RD17:
cmp bx,block6_x2
jbe C2remove_6
.ENDIF
C2RD18:

.IF(mover2<=47&&mover2>=37)
C2RD19:
cmp bx,block7_x1
jae C2RD20
jmp C2RD21
C2RD20:
cmp bx,block7_x2
jbe C2remove_7
.ENDIF
C2RD21:
.IF(mover2<=47&&mover2>=37)
C2RD22:
cmp bx,block8_x1
jae C2RD23
jmp C2RD24
C2RD23:
cmp bx,block8_x2
jbe C2remove_8
.ENDIF
C2RD24:

.IF(mover2<=47&&mover2>=37)
C2RD25:
cmp bx,block9_x1
jae C2RD26
jmp C2RD27
C2RD26:
cmp bx,block9_x2
jbe C2remove_9
.ENDIF
C2RD27:

.IF(mover2<=47&&mover2>=37)
C2RD28:
cmp bx,block10_x1
jae C2RD29
jmp C2RD30
C2RD29:
cmp bx,block10_x2
jbe C2remove_10
.ENDIF
C2RD30:

.IF(mover2<=47&&mover2>=37)
C2RD31:
cmp bx,block11_x1
jae C2RD32
jmp C2RD33
C2RD32:
cmp bx,block11_x2
jbe C2remove_11
.ENDIF
C2RD33:

.IF(mover2<=47&&mover2>=37)
C2RD34:
cmp bx,block12_x1
jae C2RD35
jmp C2RD36
C2RD35:
cmp bx,block12_x2
jbe C2remove_12
.ENDIF
C2RD36:

cmp mover,16
jb C2A3
cmp mover2,184
ja C2A3 


mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h

C2A3:
cmp mover2,180
Ja C2J15
cmp mover2,185
jae C2J3
jmp C2J4


C2J15:
mov ax,mover
cmp ax,X1
jbe C2J3
jmp C2J16
 

C2J16:
cmp ax,X2
jae C2J3 
cmp ax,X1_Helper1
jbe C2left
cmp ax,X1_Helper2
jbe C2simple_up
jmp C2up 

C2J3:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
jmp C2Ball1

C2J4:
cmp mover,15
jbe C2right

sub mover,1
add mover2,1


mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h
.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF

jmp C2down


C2remove_1:
call beep
.IF(remove1_counter==0)

add score,1
call Display_Score



.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block1_x1,ax
mov block1_x2,ax
mov block1_y1,ax
mov block1_y2,ax


mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 1     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 6    ;Right most column of window
int 10h

mov falling_Piece_X1,3
mov falling_Piece_X2,3
mov falling_Piece_Y1,3
mov falling_Piece_Y2,3
mov falling_Piece_Counter,1
jmp C2right
.ELSEIF(remove1_counter==1)


MOV CX, block1_x1   ;X1;(column)
MOV DX, block1_y1   ;Y1 ;(row)


C2Loop51:
C2l1051:
cmp cx, block1_x2;X2
je C2l1151
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l1051
C2l1151:
inc dx
mov cx,block1_x1
cmp dx,block1_y2;Y2
je C2G981
Loop C2Loop51

C2G981:
sub remove1_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C2right
.ENDIF



C2remove_2:
call beep
.IF(remove2_counter==0)

add score,1
call Display_Score

.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block2_x1,ax
mov block2_x2,ax
mov block2_y1,ax
mov block2_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 7     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 13    ;Right most column of window

int 10h
jmp C2down

.ELSEIF(remove2_counter==1)


MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C2loop132:
MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C2Loop42:
C2l82:
cmp cx, block2_x2;X2
je C2l92
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l82
C2l92:
inc dx
mov cx,block2_x1
cmp dx,block2_y2;Y2
je C2G982
Loop C2Loop42


C2G982:
sub remove2_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C2down
.ENDIF




C2remove_3:
call beep
.IF(remove3_counter==0)
add score,1
call Display_Score

.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block3_x1,ax
mov block3_x2,ax
mov block3_y1,ax
mov block3_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 14     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 19    ;Right most column of window

int 10h
jmp C2right
.ELSEIF(remove3_counter==1)


MOV CX, block3_x1   ;X1;(column)
MOV DX, block3_y1   ;Y1 ;(row)


C2Loop33:
C2l63:
cmp cx, block3_x2;X2
je C2l73
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l63
C2l73:
inc dx
mov cx,block3_x1
cmp dx,block3_y2;Y2
je C2G983
Loop C2Loop33

C2G983:
sub remove3_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C2right
.ENDIF




C2remove_4:
call beep
.IF(remove4_counter==0)
add score,1
call Display_Score

.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block4_x1,ax
mov block4_x2,ax
mov block4_y1,ax
mov block4_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 20     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 25    ;Right most column of window

int 10h
jmp C2down

.ELSEIF(remove4_counter==1)


MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C2loop134:
MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C2Loop44:
C2l84:
cmp cx, block4_x2;X2
je C2l94
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l84
C2l94:
inc dx
mov cx,block4_x1
cmp dx,block4_y2;Y2
je C2G984
Loop C2Loop44


C2G984:
sub remove4_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C2down
.ENDIF



C2remove_5:
call beep
.IF(remove5_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF

mov ax,0
mov block5_x1,ax
mov block5_x2,ax
mov block5_y1,ax
mov block5_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 26     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 31    ;Right most column of window

int 10h
jmp C2right
.ELSEIF(remove5_counter==1)


MOV CX, block5_x1   ;X1;(column)
MOV DX, block5_y1   ;Y1 ;(row)


C2Loop55:
C2l105:
cmp cx, block5_x2;X2
je C2l115
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l105
C2l115:
inc dx
mov cx,block5_x1
cmp dx,block5_y2;Y2
je C2G985
Loop C2Loop55

C2G985:
sub remove5_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C2right
.ENDIF


C2remove_6:
call beep

.IF(remove6_counter==0)
add score,1
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block6_x1,ax
mov block6_x2,ax
mov block6_y1,ax
mov block6_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 32     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h
jmp C2down
.ELSEIF(remove6_counter==1)


MOV CX, block6_x1   ;X1;(column)
MOV DX, block6_y1   ;Y1 ;(row)


C2Loop66:
C2l126:
cmp cx, block6_x2;X2
je C2l136
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l126
C2l136:
inc dx
mov cx,block6_x1
cmp dx,block6_y2;Y2
je C2G986
Loop C2Loop66

C2G986:
sub remove6_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C2down
.ENDIF


C2remove_7:
call beep
.IF(remove7_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block7_x1,ax
mov block7_x2,ax
mov block7_y1,ax
mov block7_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 1     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 6    ;Right most column of window

int 10h
jmp C2right
.ELSEIF(remove7_counter==1)


MOV CX, block7_x1   ;X1;(column)
MOV DX, block7_y1   ;Y1 ;(row)


C2Loop77:
C2l147:
cmp cx, block7_x2;X2
je C2l157
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l147
C2l157:
inc dx
mov cx,block7_x1
cmp dx,block7_y2;Y2
je C2G987
Loop C2Loop77

C2G987:
sub remove7_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C2right
.ENDIF





C2remove_8:
call beep
.IF(remove8_counter==0)

add score,1
call Display_Score


.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block8_x1,ax
mov block8_x2,ax
mov block8_y1,ax
mov block8_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 7     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 13    ;Right most column of window

int 10h
jmp C2down
.ELSEIF(remove8_counter==1)


MOV CX, block8_x1   ;X1;(column)
MOV DX, block8_y1   ;Y1 ;(row)


C2Loop88:
C2l168:
cmp cx, block8_x2;X2
je C2l178
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l168
C2l178:
inc dx
mov cx,block8_x1
cmp dx,block8_y2;Y2
je C2G988
Loop C2Loop88

C2G988:
sub remove8_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C2down
.ENDIF

C2remove_9:


.IF(remove9_counter==0)
add score,1

call Display_Score

.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block9_x1,ax
mov block9_x2,ax
mov block9_y1,ax
mov block9_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 14     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 19    ;Right most column of window



mov falling_Piece_X1,5
mov falling_Piece_X2,5
mov falling_Piece_Y1,16
mov falling_Piece_Y2,16
mov falling_Piece_Counter,1
int 10h
jmp C2right 

.ELSEIF(remove9_counter==1)


MOV CX, block9_x1   ;X1;(column)
MOV DX, block9_y1   ;Y1 ;(row)


C2Loop99:
C2l189:
cmp cx, block9_x2;X2
je C2l199
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l189
C2l199:
inc dx
mov cx,block9_x1
cmp dx,block9_y2;Y2
je C2G9
Loop C2Loop99

C2G9:
sub remove9_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C2right
.ENDIF


C2remove_10:
call beep
.IF(remove10_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block10_x1,ax
mov block10_x2,ax
mov block10_y1,ax
mov block10_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 20     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 25    ;Right most column of window

int 10h
jmp C2down
.ELSEIF(remove10_counter==1)


MOV CX, block10_x1   ;X1;(column)
MOV DX, block10_y1   ;Y1 ;(row)


C2Loop1010:
C2l2010:
cmp cx, block10_x2;X2
je C2l2110
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l2010
C2l2110:
inc dx
mov cx,block10_x1
cmp dx,block10_y2;Y2
je C2G1010
Loop C2Loop1010

C2G1010:
sub remove10_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C2down
.ENDIF



C2remove_11:
call beep

.IF(remove11_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF



mov ax,0
mov block11_x1,ax
mov block11_x2,ax
mov block11_y1,ax
mov block11_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 26     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 31    ;Right most column of window

int 10h
jmp C2right

.ELSEIF(remove11_counter==1)


MOV CX, block11_x1   ;X1;(column)
MOV DX, block11_y1   ;Y1 ;(row)


C2Loop11111:
C2l2211:
cmp cx, block11_x2;X2
je C2l2311
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l2211
C2l2311:
inc dx
mov cx,block11_x1
cmp dx,block11_y2;Y2
je C2G1011
Loop C2Loop11111

C2G1011:
sub remove11_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C2right
.ENDIF



C2remove_12:
call beep

.IF(remove12_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==36)
jmp WIN
.ENDIF


mov ax,0
mov block12_x1,ax
mov block12_x2,ax
mov block12_y1,ax
mov block12_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 32     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h
jmp C2down

.ELSEIF(remove12_counter==1)

MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


C2Loop11212:
C2l2412:
cmp cx, block12_x2;X2
je C2l2512
MOV AL, 4  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C2l2412
C2l2512:
inc dx
mov cx,block12_x1
cmp dx,block12_y2;Y2
je C2G1012
Loop C2Loop11212

C2G1012:
sub remove12_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C2down
.ENDIF



;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;////Ball Movement Ends ////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////;LEVEL 2 ENDS
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////


Continue3:
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////;LEVEL 3 STARTS
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov Heart_Counter,0
mov digitCount , 0 

mov Start_min, 0
mov min,0
;mover_bar db 1  ;23 left column
;mover2_bar db 6   ;38	right column
 
 
 
mov remove1_counter, 2
mov remove2_counter ,2
mov remove3_counter,2
mov remove4_counter ,2
mov remove5_counter ,2
mov remove6_counter ,2
mov remove7_counter, 2
mov remove8_counter , 2
mov remove9_counter , 2
mov remove10_counter , 2
mov remove11_counter , 2
mov remove12_counter , 2

mov X1,100
mov X2,200
mov Y1,182
mov Y2,192
mov X1_Helper1,130
mov X1_Helper2,169
mov X1_Helper3,200

mov X1_remove,36
mov X2_remove,38
mov Y1_remove,4
mov Y2_Remove,5

mov pointer_X,7
mov pointer_Y,51

mov block1_x1,14
mov block1_x2,55
mov block1_y1,22
mov block1_y2,32

mov block2_x1,64
mov block2_x2,105
mov block2_y1,22
mov block2_y2,32

mov block3_x1,114
mov block3_x2,155
mov block3_y1,22
mov block3_y2,32

mov block4_x1,164
mov block4_x2,205
mov block4_y1,22
mov block4_y2,32

mov block5_x1,214
mov block5_x2,255
mov block5_y1,22
mov block5_y2,32

mov block6_x1,264
mov block6_x2,305
mov block6_y1,22
mov block6_y2,32

mov block7_x1,14
mov block7_x2,55
mov block7_y1,37
mov block7_y2,47

mov block8_x1,64
mov block8_x2,105
mov block8_y1,37
mov block8_y2,47

mov block9_x1,114
mov block9_x2,155
mov block9_y1,37
mov block9_y2,47

mov block10_x1,164
mov block10_x2,205
mov block10_y1,37
mov block10_y2,47

mov block11_x1,214
mov block11_x2,255
mov block11_y1,37
mov block11_y2,47

mov block12_x1,264
mov block12_x2,305
mov block12_y1,37
mov block12_y2,47

.if(Level_counter==1)
mov X1,50
Mov X2,200
mov X1_Helper1 ,110
mov X1_Helper2, 140
mov X1_Helper3 , 200
.ElSEIF(Level_counter==2)
mov X1,80
Mov X2,180
mov X1_Helper1 ,115
mov X1_Helper2, 135
mov X1_Helper3 , 180
.ElSEIF(Level_counter==3)
mov X1,100
Mov X2,150
mov X1_Helper1 , 120
mov X1_Helper2 , 129
mov X1_Helper3 , 150
.ENDIF



mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 1    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h



mov si,@data
mov ah,13h;service to print string in graphic mode
mov al,0;sub-service 0 all the characters will be in the same color(bl) and cursor position is not updated after the string is written
mov bh,0;page number=always zero
mov bl,11;color of the text (white foreground and black background)
;     0000             1111
;|_ Background _| |_ Foreground _|
;

mov cx,8;length of string
;resoultion of the screen is 244x126
mov dh,0;y coordinate
mov dl,13;x coordinate
mov es,si;moves to es the location in memory of the data segment
.if(Level_counter==1)
mov bp,offset Level_display1;mov bp the offset of the string
.ElSEIF(Level_counter==2)
mov bp,offset Level_display2;mov bp the offset of the string
.ElSEIF(Level_counter==3)
mov bp,offset Level_display3;mov bp the offset of the string
.ENDIF

int 10h
;///////////////////////////
;Score kay nechay ki patti/
;/////////////////////////
mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 0    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 8    ;Right most column of window

int 10h

;///////////////////////////
;life kay nechay ki patti//
;/////////////////////////
mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 0    ;top row of window
mov cl, 30     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 1     ;column
int 10h

mov al,'S'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 2     ;column
int 10h

mov al,'C'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 3     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 4     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 5     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl,  6    ;column
int 10h

mov al,':'    ;ASCII code of Character 
mov bx,0
mov bl,11   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

call Display_Score

;//////////////////////////////
;/////////////////////////////
;///////Hearts //////////////
;///////////////////////////
;//////////////////////////
call First_Heart
call Second_Heart
call Third_Heart
;//////////////////////////////
;/////////////////////////////
;///////Hearts Ends//////////
;///////////////////////////
;//////////////////////////


;////////////////////////
;Bar code //////////////
;//////////////////////
;
call print
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;/////Bricks Placement /////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////


;//////////////
;Block 1//////
;////////////

MOV CX, block1_x1   ;X1;(column)
MOV DX, block1_y1   ;Y1 ;(row)


C3Loop1:
C3l1:
cmp cx, block1_x2;X2
je C3l3
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l1
C3l3:
inc dx
mov cx,block1_x1
cmp dx,block1_y2;Y2
je C3loop11
Loop C3Loop1

;//////////////
;Block 2//////
;////////////
C3loop11:
MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C3Loop2:
C3l4:
cmp cx, block2_x2;X2
je C3l5
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l4
C3l5:
inc dx
mov cx,block2_x1
cmp dx,block2_y2;Y2
je C3loop12
Loop C3Loop2

;//////////////
;Block 3//////
;////////////
C3loop12:

MOV CX, block3_x1   ;X1;(column)
MOV DX, block3_y1   ;Y1 ;(row)


C3Loop3:
C3l6:
cmp cx, block3_x2;X2
je C3l7
MOV AL, 7  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l6
C3l7:
inc dx
mov cx,block3_x1
cmp dx,block3_y2;Y2
je C3loop13
Loop C3Loop3

;//////////////
;Block 4//////
;////////////

C3loop13:
MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C3Loop4:
C3l8:
cmp cx, block4_x2;X2
je C3l9
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l8
C3l9:
inc dx
mov cx,block4_x1
cmp dx,block4_y2;Y2
je C3loop14
Loop C3Loop4


C3loop14:
;//////////////
;Block 5//////
;////////////

MOV CX, block5_x1   ;X1;(column)
MOV DX, block5_y1   ;Y1 ;(row)


C3Loop5:
C3l10:
cmp cx, block5_x2;X2
je C3l11
MOV AL, 7  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l10
C3l11:
inc dx
mov cx,block5_x1
cmp dx,block5_y2;Y2
je C3loop15
Loop C3Loop5

C3loop15:
;//////////////
;Block 6//////
;////////////

MOV CX, block6_x1   ;X1;(column)
MOV DX, block6_y1   ;Y1 ;(row)


C3Loop6:
C3l12:
cmp cx, block6_x2;X2
je C3l13
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l12
C3l13:
inc dx
mov cx,block6_x1
cmp dx,block6_y2;Y2
je C3loop16
Loop C3Loop6


C3loop16:

;//////////////
;Block 7//////
;////////////

MOV CX, block7_x1   ;X1;(column)
MOV DX, block7_y1   ;Y1 ;(row)


C3Loop7:
C3l14:
cmp cx, block7_x2;X2
je C3l15
MOV AL, 7  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l14
C3l15:
inc dx
mov cx,block7_x1
cmp dx,block7_y2;Y2
je C3loop17
Loop C3Loop7


C3loop17:
;//////////////
;Block 8//////
;////////////

MOV CX, block8_x1   ;X1;(column)
MOV DX, block8_y1   ;Y1 ;(row)


C3Loop8:
C3l16:
cmp cx, block8_x2;X2
je C3l17
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l16
C3l17:
inc dx
mov cx,block8_x1
cmp dx,block8_y2;Y2
je C3loop18
Loop C3Loop8



C3loop18:
;//////////////
;Block 9//////
;////////////

MOV CX, block9_x1   ;X1;(column)
MOV DX, block9_y1   ;Y1 ;(row)


C3Loop9:
C3l18:
cmp cx, block9_x2;X2
je C3l19
MOV AL, 9  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l18
C3l19:
inc dx
mov cx,block9_x1
cmp dx,block9_y2;Y2
je C3loop19
Loop C3Loop9

C3loop19:
;//////////////
;Block 10//////
;////////////

MOV CX, block10_x1   ;X1;(column)
MOV DX, block10_y1   ;Y1 ;(row)


C3Loop10:
C3l20:
cmp cx, block10_x2;X2
je C3l21
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l20
C3l21:
inc dx
mov cx,block10_x1
cmp dx,block10_y2;Y2
je C3loop20
Loop C3Loop10

C3loop20:
;//////////////
;Block 11//////
;////////////

MOV CX, block11_x1   ;X1;(column)
MOV DX, block11_y1   ;Y1 ;(row)


C3Loop111:
C3l22:
cmp cx, block11_x2;X2
je C3l23
MOV AL, 7  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l22
C3l23:
inc dx
mov cx,block11_x1
cmp dx,block11_y2;Y2
je C3loop21
Loop C3Loop111

C3loop21:
;//////////////
;Block 12//////
;////////////

MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


C3Loop112:
C3l24:
cmp cx, block12_x2;X2
je C3l25
MOV AL, 5  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l24
C3l25:
inc dx
mov cx,block12_x1
cmp dx,block12_y2;Y2
je C3M1
Loop C3Loop112

C3M1:
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;/////Ball Movement ////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////

;///////////////
;Initial Ball//
;/////////////
C3Ball1:
call beep2
call beep2
inc Heart_Counter
call Remove_Heart

mov mover,135
mov mover2,180

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h




C3simple_up:
call board_movement
.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif

mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C3R1:
cmp bx,block1_x1
jae C3R2
jmp C3R3
C3R2:
cmp bx,block1_x2
jbe C3remove_1
.ENDIF
C3R3:
.IF(mover2<=32&&mover2>=22)
C3R4:
cmp bx,block2_x1
jae C3R5
jmp C3R6
C3R5:
cmp bx,block2_x2
jbe C3remove_2
.ENDIF
C3R6:

.IF(mover2<=32&&mover2>=22)
C3R7:
cmp bx,block3_x1
jae C3R8
jmp C3R9
C3R8:
cmp bx,block3_x2
jbe C3remove_3
.ENDIF
C3R9:

.IF(mover2<=32&&mover2>=22)
C3R10:
cmp bx,block4_x1
jae C3R11
jmp C3R12
C3R11:
cmp bx,block4_x2
jbe C3remove_4
.ENDIF
C3R12:

.IF(mover2<=32&&mover2>=22)
C3R13:
cmp bx,block5_x1
jae C3R14
jmp C3R15
C3R14:
cmp bx,block5_x2
jbe C3remove_5
.ENDIF
C3R15:

.IF(mover2<=32&&mover2>=22)
C3R16:
cmp bx,block6_x1
jae C3R17
jmp C3R18
C3R17:
cmp bx,block6_x2
jbe C3remove_6
.ENDIF
C3R18:

.IF(mover2<=47&&mover2>=37)
C3R19:
cmp bx,block7_x1
jae C3R20
jmp C3R21
C3R20:
cmp bx,block7_x2
jbe C3remove_7
.ENDIF
C3R21:

.IF(mover2<=47&&mover2>=37)
C3R22:
cmp bx,block8_x1
jae C3R23
jmp C3R24
C3R23:
cmp bx,block8_x2
jbe C3remove_8
.ENDIF
C3R24:

.IF(mover2<=47&&mover2>=37)
C3R25:
cmp bx,block9_x1
jae C3R26
jmp C3R27
C3R26:
cmp bx,block9_x2
jbe C3remove_9
.ENDIF
C3R27:

.IF(mover2<=47&&mover2>=37)
C3R28:
cmp bx,block10_x1
jae C3R29
jmp C3R30
C3R29:
cmp bx,block10_x2
jbe C3remove_10
.ENDIF
C3R30:

.IF(mover2<=47&&mover2>=37)
C3R31:
cmp bx,block11_x1
jae C3R32
jmp C3R33
C3R32:
cmp bx,block11_x2
jbe C3remove_11
.ENDIF
C3R33:

.IF(mover2<=47&&mover2>=37)
C3R34:
cmp bx,block12_x1
jae C3R35
jmp C3R36
C3R35:
cmp bx,block12_x2
jbe C3remove_12
.ENDIF
C3R36:
cmp mover2,11
jb C3A21
mov ah,0ch
mov al ,0
mov cx,mover
mov dx,mover2
int 10h


C3A21:
cmp mover2,10
jbe C3left

sub mover2,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h


.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp C3simple_up

C3left:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif


mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C3RL1:
cmp bx,block1_x1
jae C3RL2
jmp C3RL3
C3RL2:
cmp bx,block1_x2
jbe C3remove_1
.ENDIF
C3RL3:
.IF(mover2<=32&&mover2>=22)
C3RL4:
cmp bx,block2_x1
jae C3RL5
jmp C3RL6
C3RL5:
cmp bx,block2_x2
jbe C3remove_2
.ENDIF
C3RL6:

.IF(mover2<=32&&mover2>=22)
C3RL7:
cmp bx,block3_x1
jae C3RL8
jmp C3RL9
C3RL8:
cmp bx,block3_x2
jbe C3remove_3
.ENDIF
C3RL9:

.IF(mover2<=32&&mover2>=22)
C3RL10:
cmp bx,block4_x1
jae C3RL11
jmp C3RL12
C3RL11:
cmp bx,block4_x2
jbe C3remove_4
.ENDIF
C3RL12:
.IF(mover2<=32&&mover2>=22)
C3RL13:
cmp bx,block5_x1
jae C3RL14
jmp C3RL15
C3RL14:
cmp bx,block5_x2
jbe C3remove_5
.ENDIF
C3RL15:

.IF(mover2<=32&&mover2>=22)
C3RL16:
cmp bx,block6_x1
jae C3RL17
jmp C3RL18
C3RL17:
cmp bx,block6_x2
jbe C3remove_6
.ENDIF
C3RL18:

.IF(mover2<=47&&mover2>=37)
C3RL19:
cmp bx,block7_x1
jae C3RL20
jmp C3RL21
C3RL20:
cmp bx,block7_x2
jbe C3remove_7
.ENDIF
C3RL21:

.IF(mover2<=47&&mover2>=37)
C3RL22:
cmp bx,block8_x1
jae C3RL23
jmp C3RL24
C3RL23:
cmp bx,block8_x2
jbe C3remove_8
.ENDIF
C3RL24:

.IF(mover2<=47&&mover2>=37)
C3RL25:
cmp bx,block9_x1
jae C3RL26
jmp C3RL27
C3RL26:
cmp bx,block9_x2
jbe C3remove_9
.ENDIF
C3RL27:

.IF(mover2<=47&&mover2>=37)
C3RL28:
cmp bx,block10_x1
jae C3RL29
jmp C3RL30
C3RL29:
cmp bx,block10_x2
jbe C3remove_10
.ENDIF
C3RL30:

.IF(mover2<=47&&mover2>=37)
C3RL31:
cmp bx,block11_x1
jae C3RL32
jmp C3RL33
C3RL32:
cmp bx,block11_x2
jbe C3remove_11
.ENDIF
C3RL33:

.IF(mover2<=47&&mover2>=37)
C3RL34:
cmp bx,block12_x1
jae C3RL35
jmp C3RL36
C3RL35:
cmp bx,block12_x2
jbe C3remove_12
.ENDIF
C3RL36:

cmp mover,16
jb C3A1
cmp mover2,11
jb C3A1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h


C3A1:

cmp mover2,10
jbe C3down
cmp mover,15
jbe C3up



sub mover,1
sub mover2,2

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h

.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp C3Left

C3up:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif

mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C3RU1:
cmp bx,block1_x1
jae C3RU2
jmp C3RU3
C3RU2:
cmp bx,block1_x2
jbe C3remove_1
.ENDIF
C3RU3:
.IF(mover2<=32&&mover2>=22)
C3RU4:
cmp bx,block2_x1
jae C3RU5
jmp C3RU6
C3RU5:
cmp bx,block2_x2
jbe C3remove_2
.ENDIF
C3RU6:

.IF(mover2<=32&&mover2>=22)
C3RU7:
cmp bx,block3_x1
jae C3RU8
jmp C3RU9
C3RU8:
cmp bx,block3_x2
jbe C3remove_3
.ENDIF
C3RU9:
.IF(mover2<=32&&mover2>=22)
C3RU10:
cmp bx,block4_x1
jae C3RU11
jmp C3RU12
C3RU11:
cmp bx,block4_x2
jbe C3remove_4
.ENDIF
C3RU12:

.IF(mover2<=32&&mover2>=22)
C3RU13:
cmp bx,block5_x1
jae C3RU14
jmp C3RU15
C3RU14:
cmp bx,block5_x2
jbe C3remove_5
.ENDIF
C3RU15:
.IF(mover2<=32&&mover2>=22)
C3RU16:
cmp bx,block6_x1
jae C3RU17
jmp C3RU18
C3RU17:
cmp bx,block6_x2
jbe C3remove_6
.ENDIF
C3RU18:
.IF(mover2<=47&&mover2>=37)
C3RU19:
cmp bx,block7_x1
jae C3RU20
jmp C3RU21
C3RU20:
cmp bx,block7_x2
jbe C3remove_7
.ENDIF
C3RU21:

.IF(mover2<=47&&mover2>=37)
C3RU22:
cmp bx,block8_x1
jae C3RU23
jmp C3RU24
C3RU23:
cmp bx,block8_x2
jbe C3remove_8
.ENDIF
C3RU24:

.IF(mover2<=47&&mover2>=37)
C3RU25:
cmp bx,block9_x1
jae C3RU26
jmp C3RU27
C3RU26:
cmp bx,block9_x2
jbe C3remove_9
.ENDIF
C3RU27:

.IF(mover2<=47&&mover2>=37)
C3RU28:
cmp bx,block10_x1
jae C3RU29
jmp C3RU30
C3RU29:
cmp bx,block10_x2
jbe C3remove_10
.ENDIF
C3RU30:

.IF(mover2<=47&&mover2>=37)
C3RU31:
cmp bx,block11_x1
jae C3RU32
jmp C3RU33
C3RU32:
cmp bx,block11_x2
jbe C3remove_11
.ENDIF
C3RU33:

.IF(mover2<=47&&mover2>=37)
C3RU34:
cmp bx,block12_x1
jae C3RU35
jmp C3RU36
C3RU35:
cmp bx,block12_x2
jbe C3remove_12
.ENDIF
C3RU36:

cmp mover,304
ja C3A2
cmp mover2,11
jb C3A2
mov ah,0ch
mov al ,0
mov cx,mover
mov dx,mover2
int 10h

C3A2:
cmp mover2,10
jbe C3right
cmp mover,305
jae C3left

sub mover2,1
add mover,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h

.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF
jmp C3up


C3right:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif




mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C3RR1:
cmp bx,block1_x1
jae C3RR2
jmp C3RR3
C3RR2:
cmp bx,block1_x2
jbe C3remove_1
.ENDIF
C3RR3:
.IF(mover2<=32&&mover2>=22)
C3RR4:
cmp bx,block2_x1
jae C3RR5
jmp C3RR6
C3RR5:
cmp bx,block2_x2
jbe C3remove_2
.ENDIF
C3RR6:
.IF(mover2<=32&&mover2>=22)
C3RR7:
cmp bx,block3_x1
jae C3RR8
jmp C3RR9
C3RR8:
cmp bx,block3_x2
jbe C3remove_3
.ENDIF
C3RR9:

.IF(mover2<=32&&mover2>=22)
C3RR10:
cmp bx,block4_x1
jae C3RR11
jmp C3RR12
C3RR11:
cmp bx,block4_x2
jbe C3remove_4
.ENDIF
C3RR12:

.IF(mover2<=32&&mover2>=22)
C3RR13:
cmp bx,block5_x1
jae C3RR14
jmp C3RR15
C3RR14:
cmp bx,block5_x2
jbe C3remove_5
.ENDIF
C3RR15:

.IF(mover2<=32&&mover2>=22)
C3RR16:
cmp bx,block6_x1
jae C3RR17
jmp C3RR18
C3RR17:
cmp bx,block6_x2
jbe C3remove_6
.ENDIF
C3RR18:

.IF(mover2<=47&&mover2>=37)
C3RR19:
cmp bx,block7_x1
jae C3RR20
jmp C3RR21
C3RR20:
cmp bx,block7_x2
jbe C3remove_7
.ENDIF
C3RR21:

.IF(mover2<=47&&mover2>=37)
C3RR22:
cmp bx,block8_x1
jae C3RR23
jmp C3RR24
C3RR23:
cmp bx,block8_x2
jbe C3remove_8
.ENDIF
C3RR24:

.IF(mover2<=47&&mover2>=37)
C3RR25:
cmp bx,block9_x1
jae C3RR26
jmp C3RR27
C3RR26:
cmp bx,block9_x2
jbe C3remove_9
.ENDIF
C3RR27:

.IF(mover2<=47&&mover2>=37)
C3RR28:
cmp bx,block10_x1
jae C3RR29
jmp C3RR30
C3RR29:
cmp bx,block10_x2
jbe C3remove_10
.ENDIF
C3RR30:

.IF(mover2<=47&&mover2>=37)
C3RR31:
cmp bx,block11_x1
jae C3RR32
jmp C3RR33
C3RR32:
cmp bx,block11_x2
jbe C3remove_11
.ENDIF
C3RR33:
.IF(mover2<=47&&mover2>=37)
C3RR34:
cmp bx,block12_x1
jae C3RR35
jmp C3RR36
C3RR35:
cmp bx,block12_x2
jbe C3remove_12
.ENDIF
C3RR36:
cmp mover,304
ja C3A4
cmp mover2,184
ja C3A4

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h

C3A4:
cmp mover2,180
je C3J10
cmp mover2,185
jae C3J1
jmp C3J2
 
 
C3J10:
mov ax,mover
cmp ax,X1
jae C3J11
jmp C3J1
 
 
C3J11:
cmp ax,X2
jae C3J1
cmp ax,X1_Helper1
jbe C3left
cmp ax,X1_Helper2
jbe C3simple_up
cmp ax,X2
jmp C3up

C3J1:

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
jae C3Ball1

C3J2:
cmp mover,305
jae C3down

add mover,1
add mover2,1

mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h
.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF

jmp C3right


C3down:
call board_movement

.if(falling_Piece_Counter==1)
.IF(falling_Piece_X1!=22)
call Falling_Piece
call Falling_Piece_Black
add falling_Piece_X1,1
add falling_Piece_X2,1
call Falling_Piece
call Falling_Piece_Black
.ENDIF
.IF(falling_Piece_X1>=22)
mov falling_Piece_X1,0
mov falling_Piece_X2,0
mov falling_Piece_Counter,0
.Endif
.endif
mov bx,mover
mov ax,mover2

.IF(mover2<=32&&mover2>=22)
C3RD1:
cmp bx,block1_x1
jae C3RD2
jmp C3RD3
C3RD2:
cmp bx,block1_x2
jbe C3remove_1
.ENDIF
C3RD3:
.IF(mover2<=32&&mover2>=22)
C3RD4:
cmp bx,block2_x1
jae C3RD5
jmp C3RD6
C3RD5:
cmp bx,block2_x2
jbe C3remove_2
.ENDIF
C3RD6:
.IF(mover2<=32&&mover2>=22)
C3RD7:
cmp bx,block3_x2
jbe C3RD8
jmp C3RD9
C3RD8:
cmp bx,block3_x1
jae C3remove_3
.ENDIF
C3RD9:

.IF(mover2<=32&&mover2>=22)
C3RD10:
cmp bx,block4_x1
jae C3RD11
jmp C3RD12
C3RD11:
cmp bx,block4_x2
jbe C3remove_4
.ENDIF
C3RD12:

.IF(mover2<=32&&mover2>=22)
C3RD13:
cmp bx,block5_x1
jae C3RD14
jmp C3RD15
C3RD14:
cmp bx,block5_x2
jbe C3remove_5
.ENDIF
C3RD15:

.IF(mover2<=32&&mover2>=22)
C3RD16:
cmp bx,block6_x1
jae C3RD17
jmp C3RD18
C3RD17:
cmp bx,block6_x2
jbe C3remove_6
.ENDIF
C3RD18:

.IF(mover2<=47&&mover2>=37)
C3RD19:
cmp bx,block7_x1
jae C3RD20
jmp C3RD21
C3RD20:
cmp bx,block7_x2
jbe C3remove_7
.ENDIF
C3RD21:
.IF(mover2<=47&&mover2>=37)
C3RD22:
cmp bx,block8_x1
jae C3RD23
jmp C3RD24
C3RD23:
cmp bx,block8_x2
jbe C3remove_8
.ENDIF
C3RD24:

.IF(mover2<=47&&mover2>=37)
C3RD25:
cmp bx,block9_x1
jae C3RD26
jmp C3RD27
C3RD26:
cmp bx,block9_x2
jbe C3remove_9
.ENDIF
C3RD27:

.IF(mover2<=47&&mover2>=37)
C3RD28:
cmp bx,block10_x1
jae C3RD29
jmp C3RD30
C3RD29:
cmp bx,block10_x2
jbe C3remove_10
.ENDIF
C3RD30:

.IF(mover2<=47&&mover2>=37)
C3RD31:
cmp bx,block11_x1
jae C3RD32
jmp C3RD33
C3RD32:
cmp bx,block11_x2
jbe C3remove_11
.ENDIF
C3RD33:

.IF(mover2<=47&&mover2>=37)
C3RD34:
cmp bx,block12_x1
jae C3RD35
jmp C3RD36
C3RD35:
cmp bx,block12_x2
jbe C3remove_12
.ENDIF
C3RD36:

cmp mover,16
jb C3A3
cmp mover2,184
ja C3A3 


mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h

C3A3:
cmp mover2,180
Ja C3J15
cmp mover2,185
jae C3J3
jmp C3J4


C3J15:
mov ax,mover
cmp ax,X1
jbe C3J3
jmp C3J16
 

C3J16:
cmp ax,X2
jae C3J3 
cmp ax,X1_Helper1
jbe C3left
cmp ax,X1_Helper2
jbe C3simple_up
jmp C3up 

C3J3:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
jmp C3Ball1

C3J4:
cmp mover,15
jbe C3right

sub mover,1
add mover2,1


mov ah,0ch
mov al,15
mov cx,mover
mov dx,mover2
int 10h
.if(Level_counter==1)
call delay
call delay
call delay
.ElSEIF(Level_counter==2)
call delay
call delay
.ElSEIF(Level_counter==3)
call delay
.ENDIF

jmp C3down


C3remove_1:
call beep
.IF(remove1_counter==0)

add score,1
call Display_Score



.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF


mov ax,0
mov block1_x1,ax
mov block1_x2,ax
mov block1_y1,ax
mov block1_y2,ax


mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 1     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 6    ;Right most column of window
int 10h

mov falling_Piece_X1,3
mov falling_Piece_X2,3
mov falling_Piece_Y1,3
mov falling_Piece_Y2,3
mov falling_Piece_Counter,1

jmp C3remove_12

jmp C3right
.ELSEIF(remove1_counter==1)


MOV CX, block1_x1   ;X1;(column)
MOV DX, block1_y1   ;Y1 ;(row)


C3Loop51:
C3l1051:
cmp cx, block1_x2;X2
je C3l1151
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l1051
C3l1151:
inc dx
mov cx,block1_x1
cmp dx,block1_y2;Y2
je C3G981
Loop C3Loop51

C3G981:
sub remove1_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ELSEIF(remove1_counter==2)


MOV CX, block1_x1   ;X1;(column)
MOV DX, block1_y1   ;Y1 ;(row)


C3Loop512:
C3l10512:
cmp cx, block1_x2;X2
je C3l11512
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l10512
C3l11512:
inc dx
mov cx,block1_x1
cmp dx,block1_y2;Y2
je C3G9812
Loop C3Loop512

C3G9812:
sub remove1_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ENDIF



C3remove_2:
call beep
.IF(remove2_counter==0)

add score,1
call Display_Score

.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF



mov ax,0
mov block2_x1,ax
mov block2_x2,ax
mov block2_y1,ax
mov block2_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 7     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 13    ;Right most column of window

int 10h
jmp C3down

.ELSEIF(remove2_counter==1)


MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C3loop132:
MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C3Loop42:
C3l82:
cmp cx, block2_x2;X2
je C3l92
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l82
C3l92:
inc dx
mov cx,block2_x1
cmp dx,block2_y2;Y2
je C3G982
Loop C3Loop42

C3G982:
sub remove2_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down

.ELSEIF(remove2_counter==2)


MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C3loop1322:
MOV CX, block2_x1   ;X1;(column)
MOV DX, block2_y1   ;Y1 ;(row)


C3Loop422:
C3l822:
cmp cx, block2_x2;X2
je C3l922
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l822
C3l922:
inc dx
mov cx,block2_x1
cmp dx,block2_y2;Y2
je C3G9822
Loop C3Loop42

C3G9822:
sub remove2_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down

.ENDIF




C3remove_3:
call beep
.IF(remove3_counter==0)
add score,1
call Display_Score

.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF



mov ax,0
mov block3_x1,ax
mov block3_x2,ax
mov block3_y1,ax
mov block3_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 14     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 19    ;Right most column of window

int 10h
jmp C3up
.ELSEIF(remove3_counter==1)


MOV CX, block3_x1   ;X1;(column)
MOV DX, block3_y1   ;Y1 ;(row)


C3Loop332:
C3l632:
cmp cx, block3_x2;X2
je C3l732
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l632
C3l732:
inc dx
mov cx,block3_x1
cmp dx,block3_y2;Y2
je C3G9832
Loop C3Loop332

C3G9832:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ELSEIF(remove3_counter==2)


MOV CX, block3_x1   ;X1;(column)
MOV DX, block3_y1   ;Y1 ;(row)


C3Loop33:
C3l63:
cmp cx, block3_x2;X2
je C3l73
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l63
C3l73:
inc dx
mov cx,block3_x1
cmp dx,block3_y2;Y2
je C3G983
Loop C3Loop33

C3G983:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ENDIF




C3remove_4:
call beep
.IF(remove4_counter==0)
add score,1
call Display_Score

.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF



mov ax,0
mov block4_x1,ax
mov block4_x2,ax
mov block4_y1,ax
mov block4_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 20     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 25    ;Right most column of window

int 10h
jmp C3remove_6
jmp C3down

.ELSEIF(remove4_counter==1)


MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C3loop134:
MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C3Loop44:
C3l84:
cmp cx, block4_x2;X2
je C3l94
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l84
C3l94:
inc dx
mov cx,block4_x1
cmp dx,block4_y2;Y2
je C3G984
Loop C3Loop44


C3G984:
sub remove4_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down
.ELSEIF(remove4_counter==2)


MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C3loop1342:
MOV CX, block4_x1   ;X1;(column)
MOV DX, block4_y1   ;Y1 ;(row)


C3Loop442:
C3l842:
cmp cx, block4_x2;X2
je C3l942
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l842
C3l942:
inc dx
mov cx,block4_x1
cmp dx,block4_y2;Y2
je C3G9842
Loop C3Loop442


C3G9842:
sub remove4_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down
.ENDIF



C3remove_5:
call beep
.IF(remove5_counter==0)

call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF

mov ax,0
mov block5_x1,ax
mov block5_x2,ax
mov block5_y1,ax
mov block5_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 26     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 31    ;Right most column of window

int 10h
jmp C3right
.ELSEIF(remove5_counter==1)


MOV CX, block5_x1   ;X1;(column)
MOV DX, block5_y1   ;Y1 ;(row)


C3Loop55:
C3l105:
cmp cx, block5_x2;X2
je C3l115
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l105
C3l115:
inc dx
mov cx,block5_x1
cmp dx,block5_y2;Y2
je C3G985
Loop C3Loop55

C3G985:

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ELSEIF(remove5_counter==2)


MOV CX, block5_x1   ;X1;(column)
MOV DX, block5_y1   ;Y1 ;(row)


C3Loop552:
C3l1052:
cmp cx, block5_x2;X2
je C3l1152
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l1052
C3l1152:
inc dx
mov cx,block5_x1
cmp dx,block5_y2;Y2
je C3G9852
Loop C3Loop552

C3G9852:

mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right
.ENDIF


C3remove_6:
call beep

.IF(remove6_counter==0)
add score,1
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF



mov ax,0
mov block6_x1,ax
mov block6_x2,ax
mov block6_y1,ax
mov block6_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 2   ;top row of window
mov cl, 32     ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h
jmp C3down
.ELSEIF(remove6_counter==1)


MOV CX, block6_x1   ;X1;(column)
MOV DX, block6_y1   ;Y1 ;(row)


C3Loop66:
C3l126:
cmp cx, block6_x2;X2
je C3l136
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l126
C3l136:
inc dx
mov cx,block6_x1
cmp dx,block6_y2;Y2
je C3G986
Loop C3Loop66

C3G986:
sub remove6_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down

.ELSEIF(remove6_counter==2)


MOV CX, block6_x1   ;X1;(column)
MOV DX, block6_y1   ;Y1 ;(row)


C3Loop662:
C3l1262:
cmp cx, block6_x2;X2
je C3l1362
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l1262
C3l1362:
inc dx
mov cx,block6_x1
cmp dx,block6_y2;Y2
je C3G9862
Loop C3Loop662

C3G9862:
sub remove6_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down

.ENDIF


C3remove_7:
call beep
.IF(remove7_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF


mov ax,0
mov block7_x1,ax
mov block7_x2,ax
mov block7_y1,ax
mov block7_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 1     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 6    ;Right most column of window

int 10h
jmp C3right
.ELSEIF(remove7_counter==1)


MOV CX, block7_x1   ;X1;(column)
MOV DX, block7_y1   ;Y1 ;(row)


C3Loop77:
C3l147:
cmp cx, block7_x2;X2
je C3l157
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l147
C3l157:
inc dx
mov cx,block7_x1
cmp dx,block7_y2;Y2
je C3G987
Loop C3Loop77

C3G987:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ELSEIF(remove7_counter==2)


MOV CX, block7_x1   ;X1;(column)
MOV DX, block7_y1   ;Y1 ;(row)


C3Loop772:
C3l1472:
cmp cx, block7_x2;X2
je C3l1572
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l1472
C3l1572:
inc dx
mov cx,block7_x1
cmp dx,block7_y2;Y2
je C3G9872
Loop C3Loop772

C3G9872:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ENDIF





C3remove_8:
call beep
.IF(remove8_counter==0)

add score,1
call Display_Score


.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF


mov ax,0
mov block8_x1,ax
mov block8_x2,ax
mov block8_y1,ax
mov block8_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 7     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 13    ;Right most column of window

int 10h
jmp C3remove_1
jmp C3down
.ELSEIF(remove8_counter==1)


MOV CX, block8_x1   ;X1;(column)
MOV DX, block8_y1   ;Y1 ;(row)


C3Loop88:
C3l168:
cmp cx, block8_x2;X2
je C3l178
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l168
C3l178:
inc dx
mov cx,block8_x1
cmp dx,block8_y2;Y2
je C3G988
Loop C3Loop88

C3G988:
sub remove8_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down

.ELSEIF(remove8_counter==2)


MOV CX, block8_x1   ;X1;(column)
MOV DX, block8_y1   ;Y1 ;(row)


C3Loop882:
C3l1682:
cmp cx, block8_x2;X2
je C3l1782
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l1682
C3l1782:
inc dx
mov cx,block8_x1
cmp dx,block8_y2;Y2
je C3G9882
Loop C3Loop882

C3G9882:
sub remove8_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down
.ENDIF

C3remove_9:
call beep

.IF(remove9_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF



mov ax,0
mov block9_x1,ax
mov block9_x2,ax
mov block9_y1,ax
mov block9_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 14     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 19    ;Right most column of window



mov falling_Piece_X1,5
mov falling_Piece_X2,5
mov falling_Piece_Y1,16
mov falling_Piece_Y2,16
mov falling_Piece_Counter,1
int 10h
jmp C3remove_8
jmp C3right 

.ELSEIF(remove9_counter==1)


MOV CX, block9_x1   ;X1;(column)
MOV DX, block9_y1   ;Y1 ;(row)


C3Loop99:
C3l189:
cmp cx, block9_x2;X2
je C3l199
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l189
C3l199:
inc dx
mov cx,block9_x1
cmp dx,block9_y2;Y2
je C3G9
Loop C3Loop99

C3G9:
sub remove9_counter,1
sub remove8_counter,1
sub remove1_counter,1
sub remove12_counter,1
sub remove4_counter,1
sub remove6_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ELSEIF(remove9_counter==2)


MOV CX, block9_x1   ;X1;(column)
MOV DX, block9_y1   ;Y1 ;(row)


C3Loop992:
C3l1892:
cmp cx, block9_x2;X2
je C3l1992
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l1892
C3l1992:
inc dx
mov cx,block9_x1
cmp dx,block9_y2;Y2
je C3G92
Loop C3Loop992

C3G92:
sub remove9_counter,1
sub remove8_counter,1
sub remove1_counter,1
sub remove12_counter,1
sub remove4_counter,1
sub remove6_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right
.ENDIF


C3remove_10:
call beep
.IF(remove10_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF


mov ax,0
mov block10_x1,ax
mov block10_x2,ax
mov block10_y1,ax
mov block10_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 20     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 25    ;Right most column of window

int 10h
jmp C3down
.ELSEIF(remove10_counter==1)


MOV CX, block10_x1   ;X1;(column)
MOV DX, block10_y1   ;Y1 ;(row)


C3Loop1010:
C3l2010:
cmp cx, block10_x2;X2
je C3l2110
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l2010
C3l2110:
inc dx
mov cx,block10_x1
cmp dx,block10_y2;Y2
je C3G1010
Loop C3Loop1010

C3G1010:
sub remove10_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down

.ELSEIF(remove10_counter==2)


MOV CX, block10_x1   ;X1;(column)
MOV DX, block10_y1   ;Y1 ;(row)


C3Loop10102:
C3l20102:
cmp cx, block10_x2;X2
je C3l21102
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l2010
C3l21102:
inc dx
mov cx,block10_x1
cmp dx,block10_y2;Y2
je C3G10102
Loop C3Loop10102

C3G10102:
sub remove10_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
sub mover2,1
jmp C3down
.ENDIF



C3remove_11:
call beep

.IF(remove11_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF



mov ax,0
mov block11_x1,ax
mov block11_x2,ax
mov block11_y1,ax
mov block11_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 26     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 31    ;Right most column of window

int 10h
jmp C3right

.ELSEIF(remove11_counter==1)


MOV CX, block11_x1   ;X1;(column)
MOV DX, block11_y1   ;Y1 ;(row)


C3Loop11111:
C3l2211:
cmp cx, block11_x2;X2
je C3l2311
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l2211
C3l2311:
inc dx
mov cx,block11_x1
cmp dx,block11_y2;Y2
je C3G1011
Loop C3Loop11111

C3G1011:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right

.ELSEIF(remove11_counter==2)


MOV CX, block11_x1   ;X1;(column)
MOV DX, block11_y1   ;Y1 ;(row)


C3Loop111112:
C3l22112:
cmp cx, block11_x2;X2
je C3l23112
MOV AL,7
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l22112
C3l23112:
inc dx
mov cx,block11_x1
cmp dx,block11_y2;Y2
je C3G10112
Loop C3Loop111112

C3G10112:
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3right


.ENDIF



C3remove_12:
call beep

.IF(remove12_counter==0)
add score,1
call Display_Score
.if(score==24)
add Level_counter,1
jmp Continue3
.ENDIF
.if(score==31)
jmp WIN
.ENDIF


mov ax,0
mov block12_x1,ax
mov block12_x2,ax
mov block12_y1,ax
mov block12_y2,ax
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 4   ;top row of window
mov cl, 32     ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h

jmp C3remove_4

jmp C3down

.ELSEIF(remove12_counter==1)

MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


C3Loop11212:
C3l2412:
cmp cx, block12_x2;X2
je C3l2512
MOV AL,4
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l2412
C3l2512:
inc dx
mov cx,block12_x1
cmp dx,block12_y2;Y2
je C3G1012
Loop C3Loop11212

C3G1012:
sub remove12_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3down
.ELSEIF(remove12_counter==2)

MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


MOV CX, block12_x1   ;X1;(column)
MOV DX, block12_y1   ;Y1 ;(row)


C3Loop112122:
C3l24122:
cmp cx, block12_x2;X2
je C3l25122
MOV AL,14
MOV AH, 0CH 
INT 10H
inc cx
jmp C3l24122
C3l25122:
inc dx
mov cx,block12_x1
cmp dx,block12_y2;Y2
je C3G10122
Loop C3Loop112122

C3G10122:
sub remove12_counter,1
mov ah,0ch
mov al,0
mov cx,mover
mov dx,mover2
int 10h
add mover,1
add mover2,1
jmp C3down

.ENDIF


;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;////Ball Movement Ends ////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////;LEVEL 3 ENDS
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;///////////////////////////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////










;//////////////////////////////////
;/////////////////////////////////
;////////////////////////////////
;/////Board Movement ///////////
;//////////////////////////////
;/////////////////////////////
;////////////////////////////



board_movement proc
;/////// Timer /////////////////
mov ah,2ch
int 21h
sub cl ,Start_min
cmp cl,4
je exit
;/////// Timer End /////////////

mov ah,01h
int 16h
jnz nn
jz exit2
nn:
lB2:
mov ah,01
int 16h
jnz next1 
jz lB2


next1:
mov ah,0h
int 16h



cmp al,8
je Menu
cmp al,13
je exit
cmp al,112
je Break

mov al, ah
cmp al,4bh
je left1
cmp al,4dh
je right1

Break:
mov ah, 6
mov al, 0
mov bh, 4  ;color
mov ch, 11   ;top row of window
mov cl, 10     ;left most column of window
mov dh, 15     ;Bottom row of window
mov dl, 25    ;Right most column of window

int 10h


mov si,@data

mov ah,13h
mov al,0
mov bh,0
mov bl,00001111b


mov cx,6
mov dh,13
mov dl,15
mov es,si
mov bp,offset paused 
int 10h


;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 18     ;column
int 10h


Input11:
mov ah,01h
int 21h
cmp al,80
je Rewind
cmp al,112
je Rewind
jmp Input11

Rewind:
mov ah,01
int 13h
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 10   ;top row of window
mov cl, 10     ;left most column of window
mov dh, 15     ;Bottom row of window
mov dl, 25    ;Right most column of window
int 10h

jmp exit2  


left1:
 cmp X1,20
 jbe exit2
 call Print_Black
 sub X1,20
 sub X1_Helper1,20
 sub X1_Helper2,20
 sub X1_Helper3,20
 sub X2,20
 call print


right1:

 cmp X2,310
 jae exit2
 call Print_Black
 add X1,10
 add X1_Helper1,10
 add X1_Helper2,10
 add X1_Helper3,10
 add X2,10
 call print
 
 
exit2:
ret 
board_movement endp
;////////////////////////////////
;/////Board Movement Ends //////
;//////////////////////////////


Display_Score proc
.IF(score<10)
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 7    ;column
int 10h

mov dl,48
mov ah,02h
int 21h


;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 8     ;column
int 10h

mov dx,score
add dx,48
mov ah,02h
int 21h

.ELSEIF(score>=10)
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 8     ;column
int 10h


mov ax,score    ;ASCII code of Character 
mov bl,10
div bl
mov dl,ah
add dl,48
mov ah,02h
int 21h


;setting cursor position

mov bx,0
mov ah, 2
mov dh, 0  ;row
mov dl, 7     ;column
int 10h


mov ax,score    ;ASCII code of Character 
mov bl,10
div bl
mov dl,al    ;ASCII code of Character 
add dl,48
mov ah,02h
int 21h
.ENDIF





ret
Display_Score endp


beep2 proc
 mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 2000        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 12        ; Pause for duration of note.
p1:
        mov     cx, 65500000
p2:
        dec     cx
        jne     p2
        dec     bx
        jne     p1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.


ret
beep2 endp


beep proc
 mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 1100        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 12        ; Pause for duration of note.
p1:
        mov     cx, 6550
p2:
        dec     cx
        jne     p2
        dec     bx
        jne     p1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.


ret
beep endp



delay proc

mov bx,1000000
delayer_loop:
		dec bx
		jnz delayer_loop
		
ret
delay endp


;////////////////////
;///////////////////
;///Hearts Remove//
;/////////////////
;////////////////

Remove_Heart proc
cmp Heart_Counter,1
je back
cmp Heart_Counter,2
je F1
cmp Heart_Counter,3
je F2
cmp Heart_Counter,4
je F3
cmp Heart_Counter,5
jae F4
F1:
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 0   ;top row of window
mov cl, 35     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 37    ;Right most column of window
int 10h
jmp back

F2:
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 0   ;top row of window
mov cl, 33     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 34    ;Right most column of window
int 10h
jmp back

F3:
mov ah, 6
mov al, 0
mov bh, 0  ;color
mov ch, 0   ;top row of window
mov cl, 30     ;left most column of window
mov dh, 1     ;Bottom row of window
mov dl, 32    ;Right most column of window
int 10h
jmp back
F4:
call beep

jmp exit

back:
ret 
Remove_Heart endp 


Print proc
mov cx, X1    ;(column)
mov dx, Y1    ;(row)
Loop211:
lA2:

cmp cx, X2
je l41
MOV AL, 7  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp lA2
l41:
inc dx
mov cx,X1
cmp dx,Y2
je L51
Loop Loop211

L51:
ret 
Print endp 

Print_Black proc
mov cx, X1    ;(column)
mov dx, Y1    ;(row)

Loop21111:
l21111:
cmp cx, X2
je l411
MOV AL, 0  ;black color
MOV AH, 0CH 
INT 10H
inc cx
jmp l21111
l411:
inc dx
mov cx,X1
cmp dx,Y2
je L511
Loop Loop21111

L511:
ret 
Print_Black endp 

About_us proc

mov ah, 6
mov al, 0
mov bh, 0      ; black color
mov ch, 1    ;top row of window
mov cl, 1    ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 2    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 12      ; color
mov ch, 2    ;top row of window
mov cl, 8    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 2    ;top row of window
mov cl, 14    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 2    ;top row of window
mov cl, 20    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 3      ; color
mov ch, 2    ;top row of window
mov cl, 26    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 13      ; color
mov ch, 2    ;top row of window
mov cl, 32    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h


mov ah, 6
mov al, 0
mov bh, 10      ; color
mov ch, 21    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 22     ;Bottom row of window
mov dl, 37   ;Right most column of window
int 10h


mov ah, 6
mov al, 0
mov bh, 3      ; color
mov ch, 4    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 6     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 4    ;top row of window
mov cl, 6    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 11     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 1      ; color
mov ch, 4    ;top row of window
mov cl, 21    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 26     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 4    ;top row of window
mov cl, 27    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 30     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 4    ;top row of window
mov cl, 31    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 36     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 1      ; color
mov ch, 6    ;top row of window
mov cl, 33    ;left most column of window
mov dh, 7     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 6    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 7     ;Bottom row of window
mov dl, 5     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 12      ; color
mov ch, 8    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 9     ;Bottom row of window
mov dl, 8     ;Right most column of window
int 10h


mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 8    ;top row of window
mov cl, 28    ;left most column of window
mov dh, 9     ;Bottom row of window
mov dl, 32    ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 8     ;top row of window
mov cl, 33    ;left most column of window
mov dh, 9     ;Bottom row of window
mov dl, 36     ;Right most column of window
int 10h


mov si,@data

mov ah,13h
mov al,0
mov bh,0
mov bl,00001111b


mov cx,5
mov dh,5
mov dl,15
mov es,si
mov bp,offset msg
int 10h

mov cx,25
mov dh,7
mov dl,7
mov es,si
mov bp,offset msg2
int 10h

mov cx,17
mov dh,9
mov dl,10
mov es,si
mov bp,offset msg1
int 10h

mov cx,30
mov dh,11
mov dl,5
mov es,si
mov bp,offset msg3
int 10h

mov cx,24
mov dh,13
mov dl,7
mov es,si
mov bp,offset msg4
int 10h

mov cx,9
mov dh,16
mov dl,15
mov es,si
mov bp,offset msg5
int 10h

mov cx,32
mov dh,18
mov dl,3
mov es,si
mov bp,offset msg6
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 23  ;row
mov dl, 2     ;column
int 10h


;///////////////dots////////
MOV CX, 293    ;(column)    
MOV DX, 120    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 193    ;(column)    
MOV DX, 60    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 85    ;(column)    
MOV DX, 55    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 150    ;(column)    
MOV DX, 45    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 230    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 120    ;(column)    
MOV DX, 80    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 30    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 75    ;(column)    
MOV DX, 110    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 45    ;(column)    
MOV DX, 150    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 105    ;(column)    
MOV DX, 135    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 240    ;(column)    
MOV DX, 140    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 170    ;(column)    
MOV DX, 130    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H


Input:
mov ah,01h
int 21h
cmp al,8
je Menu
jmp Input


ret
About_us endp


Instuctions proc
mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah, 6
mov al, 0
mov bh, 4    ;color
mov ch, 0    ;top row of window
mov cl, 0     ;left most column of window
mov dh, 50     ;Bottom row of window
mov dl, 50    ;Right most column of window
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 0      ; black color
mov ch, 1    ;top row of window
mov cl, 1    ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38     ;Right most column of window
int 10h


;//////////////////bricks
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 2    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 12      ; color
mov ch, 2    ;top row of window
mov cl, 8    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 2    ;top row of window
mov cl, 14    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 2    ;top row of window
mov cl, 20    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 3      ; color
mov ch, 2    ;top row of window
mov cl, 26    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 13      ; color
mov ch, 2    ;top row of window
mov cl, 32    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 10      ; color
mov ch, 21    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 22     ;Bottom row of window
mov dl, 37   ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 3      ; color
mov ch, 4    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 6     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 4    ;top row of window
mov cl, 6    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 11     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 1      ; color
mov ch, 4    ;top row of window
mov cl, 30    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 35     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 4    ;top row of window
mov cl, 27    ;left most column of window
mov dh, 5     ;Bottom row of window
mov dl, 30     ;Right most column of window
int 10h

;////////////code//////////////
mov si,@data

mov ah,13h
mov al,0
mov bh,0
mov bl,13


mov cx,11
mov dh,5
mov dl,14
mov es,si
mov bp,offset msgs
int 10h

mov cx,34
mov dh,7
mov dl,4
mov es,si
mov bp,offset msgs1
int 10h

mov cx,13
mov dh,9
mov dl,14
mov es,si
mov bp,offset msgs2
int 10h

mov cx,33
mov dh,11
mov dl,4
mov es,si
mov bp,offset msgs3
int 10h

mov cx,27
mov dh,13
mov dl,7
mov es,si
mov bp,offset msgs4
int 10h

mov cx,25
mov dh,15
mov dl,8
mov es,si
mov bp,offset msgs5
int 10h

mov cx,12
mov dh,17   ;row
mov dl,14   ;col
mov es,si
mov bp,offset msgs6
int 10h


;///////////////dots////////
MOV CX, 293    ;(column)    
MOV DX, 120    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 193    ;(column)    
MOV DX, 60    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 85    ;(column)    
MOV DX, 55    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 150    ;(column)    
MOV DX, 45    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 230    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 120    ;(column)    
MOV DX, 80    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 30    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 75    ;(column)    
MOV DX, 110    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 45    ;(column)    
MOV DX, 150    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 105    ;(column)    
MOV DX, 135    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 240    ;(column)    
MOV DX, 140    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 170    ;(column)    
MOV DX, 130    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 23    ;row
mov dl, 2     ;column
int 10h


Input2:
mov ah,01h
int 21h
cmp al,8
je Menu
jmp Input2


ret 
Instuctions endp
High_Score proc

mov ah, 6
mov al, 0
mov bh,  12     ; black color
mov ch, 1    ;top row of window
mov cl, 1    ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38     ;Right most column of window
int 10h
;///////////////dots////////
MOV CX, 293    ;(column)    
MOV DX, 120    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 193    ;(column)    
MOV DX, 60    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 85    ;(column)    
MOV DX, 55    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 150    ;(column)    
MOV DX, 45    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 230    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 120    ;(column)    
MOV DX, 80    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 30    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 75    ;(column)    
MOV DX, 110    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 45    ;(column)    
MOV DX, 150    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 105    ;(column)    
MOV DX, 135    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 240    ;(column)    
MOV DX, 140    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 170    ;(column)    
MOV DX, 130    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H



;setting cursor position
mov bx,0
mov ah, 2
mov dh, 2  ;row
mov dl, 2     ;column
int 10h

mov ah,3fh
mov cx,200
lea dx,buffer
mov bx,Filehandler
int 21h



lea dx,buffer
mov ah,09h
int 10h



Input11:
mov ah,01h
int 21h
cmp al,8
je Menu
jmp Input11


ret
High_Score endp


Falling_Piece proc

mov ah, 6
mov al, 0
mov bh, 14   ;color
mov ch, falling_Piece_X1    ;top row of window
mov cl, falling_Piece_Y1     ;left most column of window
mov dh, falling_Piece_X2    ;Bottom row of window
mov dl, falling_Piece_Y2    ;Right most column of window

int 10h


call delay
call delay

ret
Falling_Piece endp

Falling_Piece_Black proc

mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, falling_Piece_X1    ;top row of window
mov cl, falling_Piece_Y1     ;left most column of window
mov dh, falling_Piece_X2    ;Bottom row of window
mov dl, falling_Piece_Y2    ;Right most column of window

int 10h

call delay
call delay
call delay
call delay
call delay
call delay
ret
Falling_Piece_Black endp
;////////////////////
;///////////////////
;////Hearts////////
;/////////////////
;////////////////
First_Heart proc

mov ah,0ch
mov al,4
mov cx,247
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,248
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,249
mov dx,0
int 10h

;first line


mov ah,0ch
mov al,4
mov cx,246
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,247
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,248
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,249
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,250
mov dx,1
int 10h
;second line
mov ah,0ch
mov al,4
mov cx,245
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,246
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,247
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,248
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,249
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,250
mov dx,2
int 10h




;sceond half
mov ah,0ch
mov al,4
mov cx,251
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,254
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,255
mov dx,0
int 10h


mov ah,0ch
mov al,4
mov cx,256
mov dx,0
int 10h
;first line


mov ah,0ch
mov al,4
mov cx,253
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,254
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,255
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,256
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,257
mov dx,1
int 10h

;second line
mov ah,0ch
mov al,4
mov cx,252
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,253
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,254
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,255
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,256
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,257
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,258
mov dx,2
int 10h
;third line


mov ah,0ch
mov al,4
mov cx,245
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,246
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,247
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,248
mov dx,3
int 10h

mov ah,0ch
mov al,4
mov cx,249
mov dx,3
int 10h

mov ah,0ch
mov al,4
mov cx,250
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,251
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,252
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,253
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,254
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,255
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,256
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,257
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,258
mov dx,3
int 10h





;next line

mov ah,0ch
mov al,4
mov cx,246
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,247
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,248
mov dx,4
int 10h

mov ah,0ch
mov al,4
mov cx,249
mov dx,4
int 10h

mov ah,0ch
mov al,4
mov cx,250
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,251
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,252
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,253
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,254
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,255
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,256
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,257
mov dx,4
int 10h

;next line
mov ah,0ch
mov al,4
mov cx,247
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,248
mov dx,5
int 10h

mov ah,0ch
mov al,4
mov cx,249
mov dx,5
int 10h

mov ah,0ch
mov al,4
mov cx,250
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,251
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,252
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,253
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,254
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,255
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,256
mov dx,5
int 10h

;next line
mov ah,0ch
mov al,4
mov cx,248
mov dx,6
int 10h

mov ah,0ch
mov al,4
mov cx,249
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,250
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,251
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,252
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,253
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,254
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,255
mov dx,6
int 10h


;next line

mov ah,0ch
mov al,4
mov cx,249
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,250
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,251
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,252
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,253
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,254
mov dx,7
int 10h



;/////////////
;next line///
;///////////


mov ah,0ch
mov al,4
mov cx,250
mov dx,8
int 10h

mov ah,0ch
mov al,4
mov cx,251
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,252
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,253
mov dx,8
int 10h
;next line

mov ah,0ch
mov al,4
mov cx,251
mov dx,9
int 10h


mov ah,0ch
mov al,4
mov cx,252
mov dx,9
int 10h


ret 
First_Heart endp


;///////////////////////
;//////////////////////
;//Second hearts /////
;////////////////////
;///////////////////

Second_Heart proc
mov ah,0ch
mov al,4
mov cx,267
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,268
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,269
mov dx,0
int 10h
;first line


mov ah,0ch
mov al,4
mov cx,266
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,267
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,268
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,269
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,270
mov dx,1
int 10h
;second line
mov ah,0ch
mov al,4
mov cx,265
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,266
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,267
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,268
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,269
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,270
mov dx,2
int 10h




;sceond half
mov ah,0ch
mov al,4
mov cx,271
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,274
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,275
mov dx,0
int 10h


mov ah,0ch
mov al,4
mov cx,276
mov dx,0
int 10h
;first line


mov ah,0ch
mov al,4
mov cx,273
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,274
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,275
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,276
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,277
mov dx,1
int 10h

;second line
mov ah,0ch
mov al,4
mov cx,272
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,273
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,274
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,275
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,276
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,277
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,278
mov dx,2
int 10h
;third line


mov ah,0ch
mov al,4
mov cx,265
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,266
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,267
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,268
mov dx,3
int 10h

mov ah,0ch
mov al,4
mov cx,269
mov dx,3
int 10h

mov ah,0ch
mov al,4
mov cx,270
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,271
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,272
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,273
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,274
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,275
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,276
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,277
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,278
mov dx,3
int 10h





;next line

mov ah,0ch
mov al,4
mov cx,266
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,267
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,268
mov dx,4
int 10h

mov ah,0ch
mov al,4
mov cx,269
mov dx,4
int 10h

mov ah,0ch
mov al,4
mov cx,270
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,271
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,272
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,273
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,274
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,275
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,276
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,277
mov dx,4
int 10h

;next line
mov ah,0ch
mov al,4
mov cx,267
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,268
mov dx,5
int 10h

mov ah,0ch
mov al,4
mov cx,269
mov dx,5
int 10h

mov ah,0ch
mov al,4
mov cx,270
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,271
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,272
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,273
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,274
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,275
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,276
mov dx,5
int 10h

;next line
mov ah,0ch
mov al,4
mov cx,268
mov dx,6
int 10h

mov ah,0ch
mov al,4
mov cx,269
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,270
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,271
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,272
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,273
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,274
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,275
mov dx,6
int 10h


;next line

mov ah,0ch
mov al,4
mov cx,269
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,270
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,271
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,272
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,273
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,274
mov dx,7
int 10h

;////////////////////
;/////next line ////
;//////////////////

mov ah,0ch
mov al,4
mov cx,270
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,271
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,272
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,273
mov dx,8
int 10h


;////////////////////
;/////next line ////
;//////////////////

mov ah,0ch
mov al,4
mov cx,271
mov dx,9
int 10h


mov ah,0ch
mov al,4
mov cx,272
mov dx,9
int 10h



ret
Second_Heart endp
;///////////////////////
;//////////////////////
;//Third hearts //////
;////////////////////
;///////////////////
Third_Heart proc

mov ah,0ch
mov al,4
mov cx,287
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,288
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,289
mov dx,0
int 10h
;first line


mov ah,0ch
mov al,4
mov cx,286
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,287
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,288
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,289
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,290
mov dx,1
int 10h
;second line
mov ah,0ch
mov al,4
mov cx,285
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,286
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,287
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,288
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,289
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,290
mov dx,2
int 10h




;sceond half
mov ah,0ch
mov al,4
mov cx,291
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,294
mov dx,0
int 10h

mov ah,0ch
mov al,4
mov cx,295
mov dx,0
int 10h


mov ah,0ch
mov al,4
mov cx,296
mov dx,0
int 10h
;first line


mov ah,0ch
mov al,4
mov cx,293
mov dx,1
int 10h

mov ah,0ch
mov al,4
mov cx,294
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,295
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,296
mov dx,1
int 10h


mov ah,0ch
mov al,4
mov cx,297
mov dx,1
int 10h

;second line
mov ah,0ch
mov al,4
mov cx,292
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,293
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,294
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,295
mov dx,2
int 10h


mov ah,0ch
mov al,4
mov cx,296
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,297
mov dx,2
int 10h

mov ah,0ch
mov al,4
mov cx,298
mov dx,2
int 10h
;third line


mov ah,0ch
mov al,4
mov cx,285
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,286
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,287
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,288
mov dx,3
int 10h

mov ah,0ch
mov al,4
mov cx,289
mov dx,3
int 10h

mov ah,0ch
mov al,4
mov cx,290
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,291
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,292
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,293
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,294
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,295
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,296
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,297
mov dx,3
int 10h


mov ah,0ch
mov al,4
mov cx,298
mov dx,3
int 10h





;next line

mov ah,0ch
mov al,4
mov cx,286
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,287
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,288
mov dx,4
int 10h

mov ah,0ch
mov al,4
mov cx,289
mov dx,4
int 10h

mov ah,0ch
mov al,4
mov cx,290
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,291
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,292
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,293
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,294
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,295
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,296
mov dx,4
int 10h


mov ah,0ch
mov al,4
mov cx,297
mov dx,4
int 10h

;next line
mov ah,0ch
mov al,4
mov cx,287
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,288
mov dx,5
int 10h

mov ah,0ch
mov al,4
mov cx,289
mov dx,5
int 10h

mov ah,0ch
mov al,4
mov cx,290
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,291
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,292
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,293
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,294
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,295
mov dx,5
int 10h


mov ah,0ch
mov al,4
mov cx,296
mov dx,5
int 10h

;next line
mov ah,0ch
mov al,4
mov cx,288
mov dx,6
int 10h

mov ah,0ch
mov al,4
mov cx,289
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,290
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,291
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,292
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,293
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,294
mov dx,6
int 10h


mov ah,0ch
mov al,4
mov cx,295
mov dx,6
int 10h


;next line

mov ah,0ch
mov al,4
mov cx,289
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,290
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,291
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,292
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,293
mov dx,7
int 10h


mov ah,0ch
mov al,4
mov cx,294
mov dx,7
int 10h

;///////////////////
;////Next Line ////
;/////////////////

mov ah,0ch
mov al,4
mov cx,290
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,291
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,292
mov dx,8
int 10h


mov ah,0ch
mov al,4
mov cx,293
mov dx,8
int 10h


;///////////////////
;////Next Line ////
;/////////////////


mov ah,0ch
mov al,4
mov cx,291
mov dx,9
int 10h


mov ah,0ch
mov al,4
mov cx,292
mov dx,9
int 10h





ret
Third_Heart endp


;////////////////////
;///////////////////
;////Hearts End////
;/////////////////
;////////////////




exit:
call beep2

mov ah, 6
mov al, 0
mov bh, 0   ;color
mov ch, 2    ;top row of window
mov cl, 1     ;left most column of window
mov dh, 23    ;Bottom row of window
mov dl, 38    ;Right most column of window

int 10h


;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 13     ;column
int 10h

mov al,'G'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h


;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 14     ;column
int 10h

mov al,'A'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 15     ;column
int 10h

mov al,'M'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 16     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 18     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 19     ;column
int 10h

mov al,'V'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 20     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 11  ;row
mov dl, 21     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h



call beep2
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 13     ;column
int 10h

mov al,'G'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 14     ;column
int 10h

mov al,'A'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 15     ;column
int 10h

mov al,'M'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 16     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 18     ;column
int 10h

mov al,'O'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 19     ;column
int 10h
mov al,'V'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 20     ;column
int 10h

mov al,'E'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
;setting cursor position
mov bx,0
mov ah, 2
mov dh, 12  ;row
mov dl, 21     ;column
int 10h

mov al,'R'    ;ASCII code of Character 
mov bx,0
mov bl,4   ; color
mov cx,1       ;repetition count
mov ah,09h
int 10h
jmp Exit5
WIN:

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah, 6
mov al, 0
mov bh, 4    ;color
mov ch, 0    ;top row of window
mov cl, 0     ;left most column of window
mov dh, 50     ;Bottom row of window
mov dl, 50    ;Right most column of window
int 10h

mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 0      ; black color
mov ch, 1    ;top row of window
mov cl, 1    ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 38     ;Right most column of window
int 10h


;//////////////////bricks
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 2    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 12      ; color
mov ch, 2    ;top row of window
mov cl, 8    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 2    ;top row of window
mov cl, 14    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 2    ;top row of window
mov cl, 20    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 3      ; color
mov ch, 2    ;top row of window
mov cl, 26    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 2    ;top row of window
mov cl, 32    ;left most column of window
mov dh, 3     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h


mov ah, 6
mov al, 0
mov bh, 10      ; color
mov ch, 21    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 22     ;Bottom row of window
mov dl, 37   ;Right most column of window
int 10h


mov ah, 6
mov al, 0
mov bh, 3      ; color
mov ch, 5    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 6     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 5    ;top row of window
mov cl, 6    ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 11     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 1      ; color
mov ch, 5    ;top row of window
mov cl, 21    ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 26     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 5    ;top row of window
mov cl, 27    ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 30     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 14      ; color
mov ch, 5    ;top row of window
mov cl, 31    ;left most column of window
mov dh, 6     ;Bottom row of window
mov dl, 36     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 1      ; color
mov ch, 8     ;top row of window
mov cl, 33    ;left most column of window
mov dh, 9     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 8    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 9     ;Bottom row of window
mov dl, 5     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 12      ; color
mov ch, 11    ;top row of window
mov cl, 2    ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 8     ;Right most column of window
int 10h


mov ah, 6
mov al, 0
mov bh, 5      ; color
mov ch, 11    ;top row of window
mov cl, 28    ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 32    ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 11      ; color
mov ch, 11     ;top row of window
mov cl, 33    ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 36     ;Right most column of window
int 10h

;///////////////dots////////
MOV CX, 293    ;(column)    
MOV DX, 120    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 193    ;(column)    
MOV DX, 60    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 85    ;(column)    
MOV DX, 55    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 150    ;(column)    
MOV DX, 45    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 230    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 120    ;(column)    
MOV DX, 80    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 30    ;(column)    
MOV DX, 90    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 75    ;(column)    
MOV DX, 110    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 45    ;(column)    
MOV DX, 150    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 105    ;(column)    
MOV DX, 135    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 240    ;(column)    
MOV DX, 140    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

MOV CX, 170    ;(column)    
MOV DX, 130    ;(row)   
MOV AL, 13              ;pink color
MOV AH, 0CH 
INT 10H

;////////////code//////////////
mov si,@data

mov ah,13h
mov al,0
mov bh,0
mov bl,13

mov cx,7
mov dh,12
mov dl, 16
mov es,si
mov bp,offset mg1
int 10h

mov ah,13h
mov al,0
mov bh,0
mov bl,13

mov cx,12
mov dh,14
mov dl, 13
mov es,si
mov bp,offset mg2
int 10h

;setting cursor position
mov bx,0
mov ah, 2
mov dh, 23    ;row
mov dl, 2     ;column
int 10h



Exit5:
;//////////////////////////////
;/////////////////////////////
;////////////////////////////
;/////WRITING ON FILE //////
;//////////////////////////
;/////////////////////////
;////////////////////////



mov ah,40h
mov bx,Filehandler
mov cx,4
lea dx,arr_space
int 21h

mov ah,40h
mov bx,Filehandler
mov cx,6
lea dx,arr_level
int 21h

mov bx,0
mov al,Level_counter
add al,48
mov save_level[bx],al

mov ah,40h
mov bx,Filehandler
mov cx,1
lea dx,offset save_level
int 21h

mov ah,40h
mov bx,Filehandler
mov cx,4
lea dx,arr_space
int 21h

mov ah,40h
mov bx,Filehandler
mov cx,7
lea dx,arr_score
int 21h

mov si,0
mov bl,10
mov ax,score
div bl


add ah,48
inc si
add al,48
mov save_score[si],ah

dec si 
mov save_score[si],al

inc si
inc si
inc si 
mov al,10
mov save_score[si],al

mov ah,40h
mov bx,Filehandler
mov cx,2
lea dx,offset save_score
int 21h

mov cx,0
mov dx, 0
mov ah,42h
mov al,2 ; 0 beginning of file, 2 end of file
int 21h



call beep2
call beep
call beep2
call beep
call beep2
mov ah,4ch
int 21h
END