section .text
	global strcasecmp
		;int strcasecmp(const char *s1, const char *s2)

strcasecmp:
	push rbp
	mov rbp, rsp
	jmp start_compare_1

compare_lower_1:
	add r8b, 32
	jmp start_compare_2

compare_lower_2:
	add r9b, 32
	jmp compare

start_compare_1:
	mov r8b, [rdi]
	cmp r8b, 65
	jl start_compare_2
	cmp r8b, 90
	jl compare_lower_1

start_compare_2:
	mov r9b, [rsi]
	cmp r9b, 65
	jl compare
	cmp r9b, 90
	jl compare_lower_2

compare:
	cmp r8b, r9b
	jne end
	cmp r8b, 0
	je end
	cmp r9b, 0
	je end
	inc rsi
	inc rdi
	jmp start_compare_1

end:
	sub r8b, r9b
	movsx rax, r8b
	mov rsp, rbp
	pop rbp
	ret
