section .text
	global memmove
    	;void *memmove(void *dest, void const *src, size_t n)
	
memmove:
	push rbp
	mov rbp, rsp

	mov rax, rdi
	mov r8, rdi
	sub r8, rsi
	cmp r8, 0

swipe:
	xor rcx, rcx

loop:
	cmp rcx, rdx
	je end
	inc rcx
	jmp loop

end:
	mov rsp, rbp
	pop rbp
	ret
