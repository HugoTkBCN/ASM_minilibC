SECTION .text
	global strpbrk
		;char *strpbrk(const char *s, const char *accept);

strpbrk:
	push rbp
	mov rbp, rsp

	mov rdx, rdi
	jmp start_loop

loop:
	cmp BYTE [r8], 0
	je next
	mov al, [rdx]
	cmp [r8], al
	je good
	inc r8
	jmp loop

start_loop:
	cmp BYTE [rdx], 0
	je reset
	mov r8, rsi
	jmp loop

next:
	inc rdx
	jmp start_loop

good:
	mov rax, rdx
	jmp end

reset:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp
	ret
