global strstr
	; char *strstr(const char *haystack, const char *needle)
section .text

strstr:
	xor	rax, rax
	xor	r8, r8
	xor	r9, r9

start:
	xor	rcx, rcx

loop:
	mov	r8, r9
	add	r8, rcx
	mov	bl, [rdi + r8]
	cmp	byte[rsi + rcx], 0
	jz good
	cmp	byte[rdi + r8], 0
	jz end
	cmp	[rsi + rcx], bl
	jne	increment
	inc	rcx
	jmp	loop

increment:
	inc	r9
	jmp	start
	
good:
	lea	rax, [rdi + r9]
	jmp end
	
end:
	ret