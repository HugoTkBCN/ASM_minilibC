section .text
	global strchr:
    	;char *strchr(const char *str, int c)

strchr:
	xor rax, rax
	xor rcx, rcx

find:
	mov r11b, [rdi + rcx]
	cmp r11b, 0
	je loop_end
	cmp r11b, sil
	je loop
	inc rcx
	jmp find

loop_end:
	cmp sil, 0
	jne end_null
	jmp loop

loop:
	cmp rcx, 0
	je end
	inc rdi
	dec rcx
	jmp loop

end_null:
	ret

end:
	mov rax, rdi
	ret
