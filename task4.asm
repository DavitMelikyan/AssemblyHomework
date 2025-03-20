extern printf
extern scanf

section .data
	fmt_scanf db "%d",0
	fmt_printf db "The result is %d",10,0
section .bss
section .text
	global main
main:
	push rbp
	mov rbp,rsp
	sub rsp,16
	
	xor rax,rax
	mov rdi,fmt_scanf
	lea rsi, [rbp - 4]
	call scanf
	
	xor rax,rax
        mov rdi,fmt_scanf
        lea rsi, [rbp - 8]
        call scanf

	mov rcx,[rbp - 8]
	mov rbx,[rbp - 4]
	mov rax,1
L1:
	imul rbx
	LOOP L1
	
	mov rdi,fmt_printf
	mov rsi,rax
	call printf
	
	mov rsp,rbp
	pop rbp
	xor rax,rax
	ret
