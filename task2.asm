extern printf
extern scanf
section .data
	fmt_scanf dq "%d",0
	fmt_printf dq "%d",0
section .bss
	N resq 1
section .text
	global main
main:
	push rbp
	mov rbp,rsp
	xor rax,rax
	xor rbx,rbx
	mov rdi,fmt_scanf
	mov rsi, N
	call scanf
	mov rcx, [N]
	inc rcx
CALC:
	add rax,rbx
	inc rbx
	LOOP CALC

	mov rdi, fmt_printf
	mov rsi, rax
	call printf
	
	mov rsp,rbp
	pop rbp
	xor rax,rax
	ret
