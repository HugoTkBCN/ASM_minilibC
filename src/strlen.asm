section .text
	global strlen:
		;int strlen(const char *string);

strlen:
	xor rax, rax

loop:
	cmp BYTE [rdi], 0
	je end
	inc rdi
	inc rax
	jmp loop

end:
	ret