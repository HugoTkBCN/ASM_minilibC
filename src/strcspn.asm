section .text
	global strcspn
    	;size_t strcspn(const char *s, const char *reject);
strcspn:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	mov rdx, rdi
	jmp start_loop

end_loop:
	cmp BYTE [r8], 0
	je next
	mov al, [rdx]
	cmp [r8], al
	je end
	inc r8
	jmp end_loop

start_loop:
	cmp BYTE [rdx], 0
	je end
	mov r8, rsi
	jmp end_loop
next:
	inc rcx
	inc rdx
	jmp start_loop

end:
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret