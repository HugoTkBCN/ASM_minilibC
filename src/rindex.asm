section .text
	global rindex
    	;char *rindex(char const *s, int c)
	global strrchr
    	;char *strrchr(char const *s, int c)
	
rindex:
strrchr:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

count:
	cmp BYTE [rdi + rcx], 0
	jz loop
	inc rcx
	jmp count

loop:
	cmp [rdi + rcx], sil
	jz found
	cmp rcx, 0
	jz notfound
	dec rcx
	jmp loop

notfound:
	mov rax, 0
	jmp end

found:
	mov rax, rdi
	add rax, rcx

end:
	mov rsp, rbp
	pop rbp
	ret