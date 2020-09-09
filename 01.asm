INCLUDE Irvine32.inc
.386
;.model flat,stdcall
.stack 4096
;ExitProcess PROTO, dwExitCode:SDWORD
count=5
.data
	 int1        BYTE   12
	 sum		 SDWORD   0
	 out1		 BYTE    "Enter any five signed integers (up to 3 digits)：", 0
	 out2		 BYTE    "A: ",0
.code
main PROC

	call Clrscr ;清除螢幕
	mov dh,12 ;游標目的位置Y座標為此
	mov dl,39 ;游標目的位置x座標為此
	call Gotoxy
	mov edx , OFFSET out1 ;提醒使用者輸入五個任意整數
	call WriteString
	call Crlf
	mov ecx,count
L1: add int1,1
	mov dh,int1 ;游標目的位置Y座標為此
	mov dl,39 ;游標目的位置x座標為此
	call Gotoxy
    call ReadInt
	add sum,eax
	loop L1
	
	mov eax,sum
	add int1,1
	mov dh,int1 ;游標目的位置Y座標為此
	mov dl,39 ;游標目的位置x座標為此
	call Gotoxy
	mov edx , OFFSET out2 ;提醒使用者輸入五個任意整數
	call WriteString
	call Crlf
	call Crlf
	call Crlf
	add int1,1
	mov dh,int1 ;游標目的位置Y座標為此
	mov dl,39 ;游標目的位置x座標為此
	call Gotoxy
	call WriteInt
	call Crlf
        
	call WaitMsg
	;INVOKE ExitProcess , 0
main ENDP
END main