INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 StuID        SDWORD   81
	 array81	  SDWORD   81 DUP(?)
	 out1		  BYTE    "Enter the number of K�G", 0
	 K            SDWORD   0
.code
main PROC
	call Clrscr ;�M���ù�
	mov edx , OFFSET out1 ;�����ϥΪ̿�JK
	call WriteString
	call Crlf
	call ReadInt ;��JK����
	mov  K,eax
	mov     esi  , OFFSET array81

L1: mov     [esi],eax
	add     eax , K
	add     esi ,TYPE array81
	cmp     eax,StuID
	jl      L1

	call    crlf
	mov     esi , OFFSET array81
    

L2: mov     eax, [esi]
	call    WriteInt
	add     esi , TYPE array81
	mov     ebx,[esi]
	cmp     ebx,0
	jg      L2

	call    crlf 

	call WaitMsg
	INVOKE ExitProcess , 0
main ENDP
END main