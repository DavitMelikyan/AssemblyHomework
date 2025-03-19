extern printf
extern scanf

section .data
	fmt_scanf db "%d",0
	fmt_printf db "Max elememt is %d",10,0
section .bss
	arr resd 10
section .text
	global main
main:
	push rbp
	mov rbp,rsp
	
	mov rbx,0

L1: 
	cmp rbx,10
	jae L1_END
	xor rax,rax
	mov rdi, fmt_scanf
	lea rsi, [arr + 4 * rbx]
	call scanf
	
	inc rbx
	jmp L1

L1_END:
	mov rax,0
	mov eax,[arr]
	mov rbx,1
L2:
	cmp rbx, 10
	jae L2_END

	cmp eax, [arr + 4 * rbx]
	jl ASSIGN
	jmp L2
ASSIGN:
	mov eax, [arr + 4 * rbx]
	inc rbx
	jmp L2
L2_END:
	mov rdi, fmt_printf
	movsx rsi, eax
	xor rax,rax
	call printf
	add rax, [arr]
	mov rsp,rbp
	pop rbp
	xor rax,rax
	ret

