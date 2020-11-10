global memcpy
    ;void *memcpy(void *dest, void const *src, size_t n)
section .text

memcpy:
	xor rcx, rcx

loop:
	cmp rdx, rcx
	jz end
	inc rcx
	jmp loop

end:
	mov rax, rdi
	ret
