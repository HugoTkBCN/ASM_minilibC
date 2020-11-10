section .text
	global memset:
    	;void *memset(void *buffer, int c, size_t len)

memset:
	xor rcx, rcx

set:
	cmp rdx, rcx
	jle decrement
	mov [rdi], sil
	inc rdi
	inc rcx
	jmp set

decrement:
	cmp rcx, 0
	je end
	dec rdi
	dec rcx
	jmp decrement

end:
	mov rax, rdi
	ret